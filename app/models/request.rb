class Request < ActiveRecord::Base
  attr_accessible :description, :status, :request_id, :start_date, :end_date, :employee_id, :title, :relevant_skills, :location, :group

  has_many :responses
  accepts_nested_attributes_for :responses, :allow_destroy => true
  belongs_to :employee

  validates_presence_of :title, :description
  validates :description, :length => { :in => 5..200 }

  def get_responses
    Response.where(:request_id => id)
  end

  def project_status
    if end_date <= Date.today 
      "expired"
    elsif start_date <= Date.today 
      "in progress"
    elsif start_date >= Date.today 
      "open"
    end
  end
  
end

