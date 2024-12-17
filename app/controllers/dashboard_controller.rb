class DashboardController < ApplicationController
  def index
    @productions = current_user.productions
  end

  def index
    @productions = current_user&.productions
    
    @waste_data = @productions.map do |production|
      [production.process_name, production.production_raw_materials.sum { |prm| prm.raw_material.waste_rate * prm.quantity_used }]
    end

    @co2_data = @productions.map do |production|
      [production.process_name, production.production_raw_materials.sum { |prm| prm.raw_material.co2_per_kg * prm.quantity_used * prm.raw_material.waste_rate }]
    end
  end
  
end
