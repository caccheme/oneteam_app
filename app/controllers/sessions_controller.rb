class SessionsController < ApplicationController
  
  def new
  end

  def create
    employee = Employee.authenticate(params[:email], params[:password])
    if employee
    	session[:employee_id] = employee.id
        redirect_to requests_url, :notice => "Logged in!"
    else
    	flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:employee_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
