class RemoveRawMaterialIdFromProductions < ActiveRecord::Migration[7.2]
  def change
    remove_column :productions, :raw_material_id, :integer
  end
end
