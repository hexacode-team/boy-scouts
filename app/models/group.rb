class Group < ActiveRecord::Base
  acts_as_tree order: "name"

  has_and_belongs_to_many :users
  has_and_belongs_to_many :roles

  has_many :routes
  has_many :subscriptions


  def has_role?(r)
    return self.roles.find_by(:role => r)
  end

  def troop_members
    members = []
    self.users.order(:last_name).order(:first_name).each do |u|
      members.append({"name"=>u.display_name, "id"=>u.id})
    end
    members
  end


end
