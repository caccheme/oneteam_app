class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_employee
#  helper_method :author?



  def current_date
  	@current_date ||= Session.find(params[:date]) if session[:date]
  end

  private
  def current_employee
  	@current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

end
