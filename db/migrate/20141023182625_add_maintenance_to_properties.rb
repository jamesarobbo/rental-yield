class AddMaintenanceToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :maintenance, :integer
  end
end
