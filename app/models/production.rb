class Production < ApplicationRecord
  belongs_to :raw_material
  belongs_to :user

   # Validations
   validates :process_name, presence: true
   validates :quantity_used, presence: true, numericality: { greater_than: 0 } #quantité upéreure a zero 


  def quantity_wasted
    (quantity_used * raw_material.waste_rate).round(2) #2pour dire 2 décimale
  end

  def co2_emissions
    (quantity_wasted * raw_material.co2_per_kg).round(2) 
  end
end
