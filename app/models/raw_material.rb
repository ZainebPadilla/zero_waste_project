class RawMaterial < ApplicationRecord
   
  validates :name, presence: true, uniqueness: true
  validates :co2_per_kg, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :waste_rate, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :production_raw_materials
  has_many :productions, through: :production_raw_materials
end
  