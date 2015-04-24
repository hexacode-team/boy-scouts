class User < ActiveRecord::Base
  include Clearance::User

  belongs_to :group

  def admin?
      self.admin
  end
end
