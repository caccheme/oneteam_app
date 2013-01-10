class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_employee
  helper_method :author?
  helper_method :owner?

private

#  def current_employee 
#    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
#  end

  def current_employee
    @current_employee ||= Employee.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
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

  def owner? (employee)
    employee[:id] == current_employee.id
  end

end