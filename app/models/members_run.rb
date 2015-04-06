class MembersRun < ActiveRecord::Base
  belongs_to :member
  belongs_to :run
end
