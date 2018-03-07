class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :email_confirm
      t.integer :country_id
      t.integer :state_id
      t.integer :city_id
      t.timestamps
    end
  end
end
