class Run < ActiveRecord::Base
  belongs_to :route
  has_many :tasks
  has_and_belongs_to_many :users

  def in_progress?
    if !self.datetime_started.blank? && self.datetime_ended.blank?
      return true
    end
    false
  end

end
