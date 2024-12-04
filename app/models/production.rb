class Production < ApplicationRecord
 
  belongs_to :user
  has_many :production_raw_materials
  has_many :raw_materials, through: :production_raw_materials

   # Validations
   validates :process_name, presence: true
 

  def quantity_wasted
    (quantity_used * raw_material.waste_rate).round(2) #2pour dire 2 décimale
  end

  def co2_emissions
    (quantity_wasted * raw_material.co2_per_kg).round(2) 
  end
end
