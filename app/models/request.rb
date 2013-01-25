class Request < ActiveRecord::Base
  attr_accessible :description, :status, :start_date, :end_date, :employee_id, :title, :relevant_skills, :location, :group
  belongs_to :employee

  has_many :responses, :dependent => :destroy
  accepts_nested_attributes_for :responses, :allow_destroy => true

  has_many :commissions, :through => :responses
  belongs_to :commission

  has_and_belongs_to_many :skills
  belongs_to :skills

  validates_presence_of :title, :description
  validates :description, :length => { :in => 5..200 }

  def get_responses
    Response.where(:request_id => id)
  end

  def get_commissions
    Commission.where(:request_id => id)
  end

end