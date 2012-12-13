class Response < ActiveRecord::Base
  attr_accessible :comment, :response_id, :employee_id 
  belongs_to :request
  has_many :employees, :through => :requests
  
  has_many :commissions, :dependent => :destroy
  accepts_nested_attributes_for :commissions

  validates_presence_of :comment, :employee_id

 end
