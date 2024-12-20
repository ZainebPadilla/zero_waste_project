class ProductionsController < ApplicationController
  # Before any action in this controller, ensure the user is authenticated
  before_action :authenticate_user!

    # Displays the list of productions for the current user
  def index
      @productions = current_user&.productions
    #for chartkick
    @waste_data = @productions.map do |production|
      [production.process_name, production.production_raw_materials.sum { |prm| prm.raw_material.waste_rate * prm.quantity_used }]
    end

    @co2_data = @productions.map do |production|
      [production.process_name, production.production_raw_materials.sum { |prm| prm.raw_material.co2_per_kg * prm.quantity_used * prm.raw_material.waste_rate }]
    end



    # Calculation of the waste rate by process for each production
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

  
  def new
    # Initialize a new production object
    @production = Production.new
   # Fetch all raw materials and remove duplicates 
    @raw_materials = RawMaterial.all.uniq
  end


  # Handles the creation of a new production
  def create

     # Builds a new production linked to the current user
    @production = current_user.productions.build(production_params)

    if @production.save
      flash[:notice] = "Production créée avec succès."
  
      # Save associated raw materials if provided
      params[:production][:raw_materials]&.each do |_, raw_material_data| # |_ to focuse only on the value (raw_material_data).
        # Skip if no quantity was specified for the raw material
        next if raw_material_data[:quantity_used].blank? #ignore when raw materials or quantity used are nil

        ProductionRawMaterial.create!(
          production: @production,
          raw_material_id: raw_material_data[:raw_material_id],
          quantity_used: raw_material_data[:quantity_used]
        )
      end
      redirect_to productions_path
    else
      @raw_materials = RawMaterial.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @production = current_user.productions.find(params[:id]) 
    @raw_materials = RawMaterial.all 
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
    @production = current_user.productions.find(params[:id]) 
    @production.production_raw_materials.destroy_all
    @production.destroy

    redirect_to productions_path, notice: "Production successfully deleted."
  end

  private

  # Permit the necessary production parameters
  def production_params
    params.require(:production).permit(:process_name, production_raw_materials_attributes: [:id, :quantity_used])
  end
end

