class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_employee
  helper_method :author?

private

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

 def author? 
    if request[:employee_id] == current_employee.id
      true
    else
      false
    end
  end

end