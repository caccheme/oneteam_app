class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_employee
#  helper_method :author?

helper_method :author?

private

  def author?
    false
  end
 
  def current_employee
  	@current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

  def authorize
    unless author?
      flash[:error] = "unauthorized access"
      redirect_to log_in_url, alert: "Not authorized" if current_employee.nil?
      false
  end
end
end
