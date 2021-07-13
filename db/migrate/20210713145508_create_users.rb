class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :location
      t.string :address
      t.integer :zip_code
      t.integer :phone_number
      t.string :email

      t.timestamps
    end
  end
end
