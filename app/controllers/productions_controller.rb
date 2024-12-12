class ProductionsController < ApplicationController
  # Before any action in this controller, ensure the user is authenticated
  before_action :authenticate_user!

   # Displays the list of productions for the current user
  def index
    # Log the current user for debugging purposes
    Rails.logger.info "Current user: #{current_user.inspect}"

      # Fetch all productions belonging to the current user
    @productions = current_user&.productions
  

    # Log a warning if no productions are found
    if @productions.nil?
      Rails.logger.warn "Productions is nil"
    end
  
    # If the productions list is empty, prepare an empty hash for waste rates and exit the method
    if @productions.blank?
      @waste_rates_by_process = {}
      return
    end
  
    # Calculate the waste rate by process for each production
    @waste_rates_by_process = @productions.includes(:production_raw_materials).each_with_object({}) do |production, hash|
      total_waste = 0
      total_used = 0
  
      # Sum up waste and usage quantities for each raw material in the production
      production.production_raw_materials.each do |raw_material|
        total_waste += raw_material.waste_generated.to_f
        total_used += raw_material.quantity_used.to_f
      end
  
       # Compute waste rate as a percentage, or set to 0 if no materials were used
      hash[production.process_name] = total_used > 0 ? (total_waste / total_used) * 100 : 0
    end
  end

    # Render the form for creating a new production
  def new
    # Initialize a new production object
    @production = Production.new
   # Fetch all raw materials and remove duplicates 
    @raw_materials = RawMaterial.all.uniq
  end


   # Handle the creation of a new production
  def create

     # Build a new production linked to the current user
    @production = current_user.productions.build(production_params)
  
    if @production.save
      # Message de succès, qui sera affiché après la redirection
      flash[:notice] = "Production créée avec succès."
  
      # Save associated raw materials if provided
      params[:production][:raw_materials]&.each do |_, raw_material_data|
        # Skip if no quantity was specified for the raw material
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
    params.require(:production).permit(:process_name, production_raw_materials_attributes: [:id, :quantity_used])# raw raw_materials_attributes allows to uptade raw materials quantity and not just the process_name)
  end

end
