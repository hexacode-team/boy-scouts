class User < ActiveRecord::Base
  
  include Clearance::User

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :routes

  Roles = [ :admin , :leader, :member, :subscriber ]

  def admin?
    self.groups.each do |g|
      g.roles.each do |r|
        if r.role == "SiteAdmin"
          return true
        end
      end
    end
  false
  end

  def troop_leader?
    self.groups.each do |g|
      g.roles.each do |r|
        if r.role == "TroopLeader"
          return true
        end
      end
    end
    false
  end

  def troop_member?
    self.groups.each do |g|
      g.roles.each do |r|
        if r.role == "TroopMember"
          return true
        end
      end
    end
    false
  end

  def role
    if admin?
      :admin
    elsif troop_leader?
      :leader
    elsif troop_member?
      :member
    end
  end

  def is?(role_type)
    return role == role_type
  end

  def display_name
    self.last_name.to_s + ", " + self.first_name.to_s
  end

  def full_name
    self.first_name.to_s + self.last_name.to_s
  end

  def get_group_admin
    if self.is? :admin
      Group.all()
    elsif self.is? :leader
      groups_admin_for = []
      self.groups.each do |grp|
        if grp.has_role? "TroopLeader"
          g += grp.children
        end
      end
      groups_admin_for
    elsif self.is? :member
      self.groups
    end
  end

end
