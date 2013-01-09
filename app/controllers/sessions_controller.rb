class SessionsController < ApplicationController
  
  def new
  end

  def create
    employee = Employee.authenticate(params[:email], params[:password])
    if employee
    	session[:employee_id] = employee.id
      redirect_to requests_url
    else
    	flash[:notice] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:employee_id] = nil
    redirect_to root_url
  end

#  def self.sweep(time = 1.hour)
#    if time.is_a?(String)
#      time = time.split.inject { |count, unit| count.to_i.send(unit) }
#    end
 
#    delete_all "updated_at < '#{time.ago.to_s(:db)}' OR
#      created_at < '#{2.days.ago.to_s(:db)}'"
#  end

end
