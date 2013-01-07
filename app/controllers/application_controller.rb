class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_employee
  helper_method :author?

private

  def current_employee 
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

  def signed_in_employee
    unless signed_in?
      redirect_to log_in_url, notice: "Please sign in."
    end
  end

  def signed_in?
    if session[:employee_id]
      true
    end
  end

 def author? (request)
     request[:employee_id] == current_employee.id
 end

end