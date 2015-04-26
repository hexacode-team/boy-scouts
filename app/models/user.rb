class User < ActiveRecord::Base
  
  include Clearance::User

  belongs_to :group

  Roles = [ :admin , :leader, :member, :subscriber ]

  def role
    if self.admin
      :admin
    else
      # TODO: other roles
      :member
    end
  end

  def is?(role_type)
    return role == role_type
  end

end
