class AddFieldToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :postal_code_short, :string
  end
end
