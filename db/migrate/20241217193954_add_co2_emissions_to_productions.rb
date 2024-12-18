class AddCo2EmissionsToProductions < ActiveRecord::Migration[7.2]
  def change
    add_column :productions, :co2_emissions, :decimal
  end
end
