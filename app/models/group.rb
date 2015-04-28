class Group < ActiveRecord::Base
  acts_as_tree order: "name"

  has_and_belongs_to_many :users
  has_and_belongs_to_many :roles

  has_many :routes
  has_many :subscriptions


  def self.has_role?(r)
    return self.roles.find_by(:role => r)
  end

end
