class Request < ActiveRecord::Base
  attr_accessible :description, :status, :request_id, :start_date, :end_date, :employee_id

  has_many :responses
  accepts_nested_attributes_for :responses, :allow_destroy => true
  belongs_to :employee

  validates_presence_of :description, :status
  validates :description, :length => { :in => 5..200 }

#  def project_status(attributes = {})  This was not working but want to keep to look at later.
#    @start_date = attributes[:start_date]
#    @end_date = attributes[:end_date]

#    if start_date = Date.today
#      'in progress'
#    elsif '@end_date' => 'Date.today' 
#      'expired'  
#    else
#      'open'  
#    end
#  end 

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

