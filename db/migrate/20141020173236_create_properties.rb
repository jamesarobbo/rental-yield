class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|

      t.string :email
      t.string :phone_number
      t.string :postal_code
      t.integer :property_price
      t.integer :property_rent

      t.timestamps


    end
  end
end
