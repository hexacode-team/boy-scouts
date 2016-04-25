class Subscriber < ActiveRecord::Base
  has_many :subscriptions

  def name
    if last_name.nil? || first_name.nil?
      return ''
    end
    return last_name + ', ' + first_name
  end
end
