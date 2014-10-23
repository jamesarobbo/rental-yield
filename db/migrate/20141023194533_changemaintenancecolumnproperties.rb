class Changemaintenancecolumnproperties < ActiveRecord::Migration
  def change
  	change_column :properties, :maintenance, :integer, default: 0
  end
end
