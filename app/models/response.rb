class Response < ActiveRecord::Base
  attr_accessible :comment, :response_id, :employee_id, :employee_name 
  belongs_to :request
  has_many :employees, :through => :requests
  
  has_many :commissions, :dependent => :destroy
  accepts_nested_attributes_for :commissions, :allow_destroy => true

  validates_presence_of :comment, :employee_id

  def initialize(attributes = {})
    @name  = attributes[:employee_name]
  end

  def formatted_name
    "#{@name}"
  end

 end
