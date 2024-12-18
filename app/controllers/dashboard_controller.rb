class DashboardController < ApplicationController

  def index
    @productions = current_user&.productions
    
    @waste_data = @productions.map do |production|
      [production.process_name, production.production_raw_materials.sum { |prm| prm.raw_material.waste_rate * prm.quantity_used }]
    end

    @co2_data = @productions.map do |production|
      [production.process_name, production.production_raw_materials.sum { |prm| prm.raw_material.co2_per_kg * prm.quantity_used * prm.raw_material.waste_rate }]
    end

    @co2_colors = @productions.map.with_index do |production, index|
      "#"+("%06x" % (rand * 0xffffff)).to_s  # Génère une couleur hexadécimale aléatoire
    end
    
    @combined_data = @productions.map do |production|
      waste_quantity = production.production_raw_materials.sum { |prm| prm.raw_material.waste_rate * prm.quantity_used }
      co2_emissions = production.production_raw_materials.sum { |prm| prm.raw_material.co2_per_kg * prm.quantity_used * prm.raw_material.waste_rate }

      { process: production.process_name, waste: waste_quantity, co2: co2_emissions }
    end
  
  end
  
end
