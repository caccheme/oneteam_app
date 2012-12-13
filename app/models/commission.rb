class Commission < ActiveRecord::Base
  attr_accessible :comment, :employee_id, :request_id, :response_id

  belongs_to :response
  has_many :requests, :through => :responses
  has_many :employees, :through => :responses

end
