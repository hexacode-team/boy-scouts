class AddSubscriberToSubscriptions < ActiveRecord::Migration
  def change
    add_reference :subscriptions, :subscriber, index: true, foreign_key: true
  end
end
