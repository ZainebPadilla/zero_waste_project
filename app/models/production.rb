class Production < ApplicationRecord
 
  belongs_to :user
  has_many :production_raw_materials, dependent: :destroy
  has_many :raw_materials, through: :production_raw_materials

  accepts_nested_attributes_for :production_raw_materials #allows rails tomanage raw materiamls attributes in prroduction

   validates :process_name, presence: true
 

  def quantity_wasted
    production_raw_materials.sum { |prm| prm.raw_material.waste_rate * prm.quantity_used }.round(2) #2 for 2 décimal
  end

  def co2_emissions
    production_raw_materials.sum { |prm| prm.raw_material.co2_per_kg * prm.quantity_used * prm.raw_material.waste_rate }.round(2) 
  end
  
end
