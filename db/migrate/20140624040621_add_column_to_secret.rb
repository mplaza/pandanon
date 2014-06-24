class AddColumnToSecret < ActiveRecord::Migration
  def change
  	add_column :secrets, :locdata, :string
  end
end
