class ProductionRawMaterial < ApplicationRecord
  belongs_to :production
  belongs_to :raw_material

  validates :quantity_used, numericality: { greater_than_or_equal_to: 0 }


  def waste_rate
    return 0 if quantity_used.to_f.zero? # Éviter la division par zéro
    (waste_generated.to_f / quantity_used.to_f) * 100
  end

   # Method to calculate generated waste
  def waste_generated
    return 0 if quantity_used.to_f.zero? # Éviter la division par zéro
    (quantity_used.to_f * raw_material.waste_rate).round(2)
  end
end
