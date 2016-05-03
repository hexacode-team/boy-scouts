class AddSubscriptionAmountToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :subscription_amount, :integer
  end
end
