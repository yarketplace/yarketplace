class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :name
      t.text :location
      t.text :address
      t.integer :zip_code
      t.integer :phone_number
      t.text :email

      t.timestamps
    end
  end
end
