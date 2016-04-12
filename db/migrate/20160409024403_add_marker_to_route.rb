class AddMarkerToRoute < ActiveRecord::Migration
  def change
    add_column :routes, :marker, :string
  end
end
