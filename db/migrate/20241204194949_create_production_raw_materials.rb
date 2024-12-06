class CreateProductionRawMaterials < ActiveRecord::Migration[7.2]
  def change
    create_table :production_raw_materials do |t|
      t.references :production, null: false, foreign_key: true
      t.references :raw_material, null: false, foreign_key: true
      t.decimal :quantity_used

      t.timestamps
    end
  end
end
