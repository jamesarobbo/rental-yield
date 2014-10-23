class Changemaintenancecolumnbackproperties < ActiveRecord::Migration
  def change

  	change_column :properties, :maintenance, :integer
  end
end
