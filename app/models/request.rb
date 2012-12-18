class Request < ActiveRecord::Base
  attr_accessible :description, :status, :request_id, :start_date, :end_date

  has_many :responses
  accepts_nested_attributes_for :responses, :allow_destroy => true
  belongs_to :employee

  validates_presence_of :description, :status
  validates :description, :length => { :in => 5..200 }

  scope :available, includes(:requests).where('requests.status' => "open")
  scope :taken, includes(:requests).where('requests.status' => "assigned")
  scope :completed, includes(:requests).where('request.status' => "completed") 

  # or where('request.end_date' < current_date)

# def current_date
#      ::Time.zone ? ::Time.zone.today : ::Date.today
# end

#  default_scope Request.see_available
#  default_scope :conditions => ["end_date <= ?", "too_late?"]

#  def see_available 
#  	request = find_by_status(status)
#  	if Request.status = "open"
#  		request
#  	else
#  		nil
#  	end
#  end

# def too_late? ( date )
#   end_date < DateTime.now 
# end
  
end

