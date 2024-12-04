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
      redirect_to productions_path, notice: "Production créée avec succès."
    else
      @raw_materials = RawMaterial.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def production_params
    params.require(:production).permit(:process_name, :raw_material_id, :quantity_used)
  end
end
