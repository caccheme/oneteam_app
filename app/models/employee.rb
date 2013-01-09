class Employee < ActiveRecord::Base
  attr_protected :password_salt, :password_hash 
  attr_accessible :employee_id, :password, :password_confirmation, :department, :email, :group, :location, :manager, :name, :position, :skills, :skills_interested_in, :years_with_company

  attr_accessor :password
  before_save :encrypt_password

  has_many :requests
  has_many :responses

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :password, :length => { :in => 5..20 }, :on => :create
  validates_presence_of :email, :name  
  validates_uniqueness_of :email, :name


  def self.authenticate(email, password)
    employee = find_by_email(email)
    if employee && employee.password_hash == BCrypt::Engine.hash_secret(password, employee.password_salt)
      employee
    else
      nil
    end
  end      

  def encrypt_password
  	if password.present?
  		self.password_salt = BCrypt::Engine.generate_salt
  		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  	end	
  end

end
