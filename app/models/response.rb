class Response < ActiveRecord::Base
  attr_accessible :comment, :response_id, :employee_id, :employee_name 
  belongs_to :request
  has_many :employees, :through => :requests
  
  has_many :commissions, :dependent => :destroy
  accepts_nested_attributes_for :commissions, :allow_destroy => true

  validates_presence_of :comment, :employee_id

  def get_commissions
    Commission.where(:response_id => id)
  end

 end
