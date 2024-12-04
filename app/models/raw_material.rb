class RawMaterial < ApplicationRecord
    # Validations
    validates :name, presence: true, uniqueness: true
    validates :co2_per_kg, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :waste_rate, presence: true, numericality: { greater_than_or_equal_to: 0 }
  end
  