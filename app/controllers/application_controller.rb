class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_employee
  helper_method :current_date

  private
  def current_employee
  	@current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end
  
#  def current_date
#  	@current_date ||= Session.find(params[:date]) if session[:date]
#  end

#still working on date restriction for requests the above may not be right...keep in mind

end
