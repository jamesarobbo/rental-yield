class AddColumnsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :yearly_yield, :integer
    add_column :properties, :yearly_yield_percent, :float
  end
end
