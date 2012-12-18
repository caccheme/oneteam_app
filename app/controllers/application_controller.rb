class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_employee
#  helper_method :author?

  private
  def current_employee
  	@current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

#  def authorize
#   unless author?
#   	flash[:error] = "unauthorized access"
#   	redirect_to root_url
#   	false
#  end

#  def author?
#  	current_employee.author?

#  	if @current_employee.employee_id = request.employee_id 
#  	  true
#    else
#  	  false
#    end
# end 


#  def current_date
#  	@current_date ||= Session.find(params[:date]) if session[:date]
#  end

#still working on date restriction for requests the above may not be right...keep in mind

end
