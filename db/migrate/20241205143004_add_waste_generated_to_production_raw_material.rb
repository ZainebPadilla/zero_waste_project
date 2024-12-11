class AddWasteGeneratedToProductionRawMaterial < ActiveRecord::Migration[7.2]
  def change
    add_column :production_raw_materials, :waste_generated, :decimal
  end
end
