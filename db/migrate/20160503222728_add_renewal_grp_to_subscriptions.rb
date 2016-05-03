class AddRenewalGrpToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :renewal_grp, :float
  end
end
