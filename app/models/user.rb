class User < ActiveRecord::Base
  
  include Clearance::User

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :routes

  Roles = [ :admin , :leader, :member, :subscriber ]

  def role
    if self.admin
      :admin
    else
      # TODO: other roles
      :member
    end
  end

  def admin?
    self.groups.each do |g|
      if g.admin?
        return true
      end
    end
  false
  end

  def is?(role_type)
    return role == role_type
  end

  def display_name
    self.last_name + ', ' + self.first_name
  end

  def full_name
    self.first_name + self.last_name
  end

  def self.get_group_admin(user_id)
    group = Group.where(:user_id => user_id)
  end

end
