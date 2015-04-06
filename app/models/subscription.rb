class Subscription < ActiveRecord::Base
    belongs_to :member
    belongs_to :route
    
end
