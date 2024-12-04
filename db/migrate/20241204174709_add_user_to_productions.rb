class AddUserToProductions < ActiveRecord::Migration[7.2]
  def change
    add_reference :productions, :user, null: false, foreign_key: true
  end
end
