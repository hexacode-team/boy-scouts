class Subscription < ActiveRecord::Base
    has_many :payments
    belongs_to :users
    belongs_to :route
    
end
