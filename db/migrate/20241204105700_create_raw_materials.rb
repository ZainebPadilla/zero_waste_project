class CreateRawMaterials < ActiveRecord::Migration[7.2]
  def change
    create_table :raw_materials do |t|
      t.string :name
      t.decimal :co2_per_kg
      t.decimal :waste_rate

      t.timestamps
    end
  end
end
