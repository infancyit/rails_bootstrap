class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.string :name
      t.integer :country_id
      t.timestamps
    end
  end
end
