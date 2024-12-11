class ProductionsController < ApplicationController
  before_action :authenticate_user! # Ensure the user is authenticated before any action

  def index
    # Get the current user's productions
    @productions = current_user&.productions

    # Return early if no productions exist
    if @productions.blank?
      @waste_rates_by_process = {}
      @raw_material_data = {}
      @co2_data = {}
      return
    end

    # Calculate waste rate for each process
    # Waste rate = (total waste / total used) * 100
    @waste_rates_by_process = @productions.includes(:production_raw_materials).each_with_object({}) do |production, hash|
      total_waste = production.production_raw_materials.sum { |prm| prm.waste_generated.to_f }
      total_used = production.production_raw_materials.sum { |prm| prm.quantity_used.to_f }
      hash[production.process_name] = total_used > 0 ? (total_waste / total_used) * 100 : 0
    end

    # Calculate total quantity used for each raw material
    # Group raw materials by name and sum their quantities
    @raw_material_data = @productions.includes(:production_raw_materials).flat_map(&:production_raw_materials)
                                     .group_by { |prm| prm.raw_material.name }
                                     .transform_values { |prms| prms.sum(&:quantity_used) }
    Rails.logger.info "Raw Material Data: #{@raw_material_data.inspect}"

    # Calculate CO₂ emissions for each process
    # CO₂ = co2_per_kg * quantity_used * waste_rate
    @co2_data = @productions.each_with_object({}) do |production, hash|
      hash[production.process_name] = production.production_raw_materials.sum do |prm|
        if prm.raw_material.co2_per_kg && prm.raw_material.waste_rate
          prm.raw_material.co2_per_kg * prm.quantity_used * prm.raw_material.waste_rate
        else
          0
        end
      end
    end

    # Waste quantity data (kg)
@waste_data = @productions.each_with_object({}) do |production, hash|
  waste_quantity = production.production_raw_materials.sum { |prm| prm.raw_material.waste_rate * prm.quantity_used }
  hash[production.process_name] = waste_quantity
end

# CO₂ emissions data (kg)
@co2_data = @productions.each_with_object({}) do |production, hash|
  co2_emissions = production.production_raw_materials.sum { |prm| prm.raw_material.co2_per_kg * prm.quantity_used * prm.raw_material.waste_rate }
  hash[production.process_name] = co2_emissions
end
    Rails.logger.info "CO2 Data: #{@co2_data.inspect}"
  end

  def new
    @production = Production.new
    @raw_materials = RawMaterial.all.uniq # Get all unique raw materials
  end

  def create
    @production = current_user.productions.build(production_params)

    if @production.save
      # Save associated raw materials for the production
      params[:production][:raw_materials]&.each do |_, raw_material_data|
        next if raw_material_data[:quantity_used].blank?

        ProductionRawMaterial.create!(
          production: @production,
          raw_material_id: raw_material_data[:raw_material_id],
          quantity_used: raw_material_data[:quantity_used]
        )
      end

      redirect_to productions_path, notice: "Production successfully created."
    else
      @raw_materials = RawMaterial.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Find the production to edit
    @production = current_user.productions.find(params[:id])
    @raw_materials = RawMaterial.all # Get all raw materials
  end

  def update
    @production = current_user.productions.find(params[:id])

    if @production.update(production_params)
      redirect_to productions_path, notice: "Production successfully updated."
    else
      @raw_materials = RawMaterial.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # Find the production and delete its raw materials
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

