class Request < ActiveRecord::Base
  attr_accessible :description, :status, :request_id, :start_date, :end_date, :employee_id

  has_many :responses
  accepts_nested_attributes_for :responses, :allow_destroy => true
  belongs_to :employee

  validates_presence_of :description, :status
  validates :description, :length => { :in => 5..200 }

  def project_status
    if ("start_date = 'Date.today'")
      "in progress"
    elsif ("end_date = 'Date.today'");("status => 'open'")
      "expired"
    elsif ("end_date = 'Date.today'");("status => 'in progress'")
      "completed"  
    elsif("start_date = 'Date.today'");("status => 'open'")
      "open"
    elsif("start_date = 'Date.today'");("status=> 'assigned'")
      "assigned"  
    end
  end  
end

