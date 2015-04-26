class User < ActiveRecord::Base
include Clearance::User

  include Clearance::User
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :routes

  def admin?
      self.groups.each do |g|
        if g.admin?
          return true

        end
      end
      false
  end

  def display_name
      self.last_name + ', ' + self.first_name
  end

  def full_name
    self.first_name + self.last_name
  end

end
