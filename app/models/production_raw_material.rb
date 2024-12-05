class ProductionRawMaterial < ApplicationRecord
  belongs_to :production
  belongs_to :raw_material

  validates :quantity_used, presence: true, numericality: { greater_than: 0 }
end
