class AddQtyCompToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :qty_comp, :integer
  end
end
