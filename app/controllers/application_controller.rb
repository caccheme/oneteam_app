class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_employee
  helper_method :author?
  helper_method :is_owner?
#  helper_method :correct_employee?

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

# def is_owner? (employee) 
#    params[:employee_id] == current_employee.id
# end

 def is_owner?
   current_employee.id == params[:id]
 end

# def correct_user?
#    @employee = Employee.find(params[:id])
#    redirect_to(root_path) unless current_employee 
# end

end