class ProductionsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @productions = current_user.productions
  end

  
  def new
    @production = Production.new
    @raw_materials = RawMaterial.all
  end

  def create
    @production = current_user.productions.build(production_params)
  
    if @production.save
      # Message de succès, qui sera affiché après la redirection
      flash[:notice] = "Production créée avec succès."
  
      # Enregistrer les matières premières associées à la production
      params[:production][:raw_materials]&.each do |_, raw_material_data|
        next if raw_material_data[:quantity_used].blank?
  
        ProductionRawMaterial.create!(
          production: @production,
          raw_material_id: raw_material_data[:raw_material_id],
          quantity_used: raw_material_data[:quantity_used]
        )
      end
  
      # Redirection vers la page des productions avec un message de succès
      redirect_to productions_path
    else
      # En cas d'erreur, on réaffiche la page de création avec les erreurs visibles dans la vue
      @raw_materials = RawMaterial.all
      render :new, status: :unprocessable_entity
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
