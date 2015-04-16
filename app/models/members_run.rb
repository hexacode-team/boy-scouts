class MembersRun < ActiveRecord::Base
  belongs_to :users
  belongs_to :run
end
