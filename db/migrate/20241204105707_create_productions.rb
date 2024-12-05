class CreateProductions < ActiveRecord::Migration[7.2]
  def change
    create_table :productions do |t|
      t.string :process_name
      t.references :raw_material, null: false, foreign_key: true
      t.decimal :quantity_used

      t.timestamps
    end
  end
end
