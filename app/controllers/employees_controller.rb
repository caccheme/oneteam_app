class EmployeesController < ApplicationController
respond_to :html, :json
before_filter :signed_in_employee, only: [:edit, :update, :index]
# before_filter :correct_employee?,   only: [:edit, :update]
before_filter :current_employee
before_filter :is_owner, :only => [:edit, :update, :destroy]

  def index
    @employees = Employee.order(:id).page(params[:page]).per(10)
    respond_with(@employees) 
  end

  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  def new
    @employee = Employee.new
    respond_with(@employee)
 
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(params[:employee])
 
    if @employee.save
      flash[:notice] = "Successfully created account profile."
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    
    respond_with(@employee)
  end

end