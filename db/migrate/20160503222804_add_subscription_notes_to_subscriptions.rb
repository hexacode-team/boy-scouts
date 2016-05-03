class AddSubscriptionNotesToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :subscription_notes, :string
  end
end
