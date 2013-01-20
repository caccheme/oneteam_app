class Request < ActiveRecord::Base
  attr_accessible :description, :status, :request_id, :start_date, :end_date, :employee_id, :title, :relevant_skills, :location, :group, :responses_attributes

  has_many :responses, :dependent => :destroy
  accepts_nested_attributes_for :responses
  belongs_to :employee

  validates_presence_of :title, :description
  validates :description, :length => { :in => 5..200 }

  def get_responses
    Response.where(:request_id => id)
  end

  def get_commissions
    Commission.where(:request_id => id)
  end

  def project_status 
    if end_date <= Date.today 
      "Closed, Completed"
    elsif end_date <= Date.today 
      "Expired"   
    elsif start_date <= Date.today 
      "Open, In progress"
    elsif start_date >= Date.today 
      "Open, Not Started"  
    elsif start_date >= Date.today   
      "Assigned"
    end


  end

#need to add method or way to mark '&& condition' then 'assigned' to the project status, perhaps after figure out 'assigned' link method

end