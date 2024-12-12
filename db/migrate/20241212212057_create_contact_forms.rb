class CreateContactForms < ActiveRecord::Migration[7.2]
  def change
    create_table :contact_forms do |t|
      t.timestamps
    end
  end
end
