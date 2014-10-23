class RemoveDefaultFromMaintenanceProperties < ActiveRecord::Migration
  def change
  	change_column :properties, :maintenance, :integer, default: nil
  end
end
