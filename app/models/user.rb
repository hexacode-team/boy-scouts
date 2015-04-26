class User < ActiveRecord::Base
include Clearance::User

  include Clearance::User
  belongs_to :group

  def admin?
      self.admin
  end

  def self.get_group_admin(user_id)
  	  group = Group.where(:user_id => user_id)
  end

end
