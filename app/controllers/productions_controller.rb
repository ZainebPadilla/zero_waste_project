class ProductionsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    Rails.logger.info "Current user: #{current_user.inspect}"
    @productions = current_user&.productions
  
    if @productions.nil?
      Rails.logger.warn "Productions is nil"
    end
  
    # Assurez-vous que @productions est un ActiveRecord::Relation
    if @productions.blank?
      @waste_rates_by_process = {}
      return
    end
  
    # Calculer le taux de déchet par processus
    @waste_rates_by_process = @productions.includes(:production_raw_materials).each_with_object({}) do |production, hash|
      total_waste = 0
      total_used = 0
  
      production.production_raw_materials.each do |raw_material|
        total_waste += raw_material.waste_generated.to_f
        total_used += raw_material.quantity_used.to_f
      end
  
      hash[production.process_name] = total_used > 0 ? (total_waste / total_used) * 100 : 0
    end
  end

  
  def new
    @production = Production.new
    @raw_materials = RawMaterial.all.uniq
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
    @production = current_user.productions.find(params[:id]) #trouver la production pour pouvoir la supprimer
    @raw_materials = RawMaterial.all #find all raw maerials
  end

  def update
    @production = current_user.productions.find(params[:id])

    
    if @production.update(production_params)
      redirect_to productions_path, notice: "Production mise à jour avec succès."
    else
      
      @raw_materials = RawMaterial.all
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @production = current_user.productions.find(params[:id]) #find production to destroy it/ delete it

     # delete raw materials 
    @production.production_raw_materials.destroy_all

    @production.destroy
    redirect_to productions_path, notice: "Production supprimée avec succès."
  end

  private

  def production_params
    params.require(:production).permit(:process_name)
  end

end
