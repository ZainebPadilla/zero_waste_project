class ProductionsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @productions = current_user.productions
  end

  # afficher le formulaire de création d'une production
  def new
    @production = Production.new
    @raw_materials = RawMaterial.all
  end

  def create
    @production = current_user.productions.build(production_params)


    if @production.save

    # Parcourir les matières premières passées dans les paramètres
    params[:production][:raw_materials]&.each do |_, raw_material_data|
      # Vérifier si `quantity_used` est fourni et non vide
      next if raw_material_data[:quantity_used].blank?

      ProductionRawMaterial.create!(
        production: @production,
        raw_material_id: raw_material_data[:raw_material_id],
        quantity_used: raw_material_data[:quantity_used]
      )
    end


      redirect_to productions_path, notice: "Production créée avec succès."
    else
      @raw_materials = RawMaterial.all
      render :new, status: :unprocessable_entity, notice: "remplir les champs manquants"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @production.destroy
    redirect_to productions_path, notice: "Production supprimée avec succès."
  end

  private

  def production_params
    params.require(:production).permit(:process_name)
  end

end
