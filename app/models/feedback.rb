class Feedback < ActiveRecord::Base
  attr_accessible :comment

  belongs_to :employee
end
