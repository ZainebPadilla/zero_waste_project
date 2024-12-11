class Production < ApplicationRecord
 
  belongs_to :user
  has_many :production_raw_materials, dependent: :destroy
  has_many :raw_materials, through: :production_raw_materials

  accepts_nested_attributes_for :production_raw_materials #allows rails tomanage raw materiamls attributes in prroduction

   # Validations
   validates :process_name, presence: true
 

  def quantity_wasted
    (quantity_used * raw_material.waste_rate).round(2) #2 for 2 décimal
  end

  def co2_emissions
    (quantity_wasted * raw_material.co2_per_kg).round(2) 
  end
end
