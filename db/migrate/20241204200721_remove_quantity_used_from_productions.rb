class RemoveQuantityUsedFromProductions < ActiveRecord::Migration[7.2]
  def change
    remove_column :productions, :quantity_used, :decimal
  end
end
