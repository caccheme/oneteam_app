class EmployeesController < ApplicationController
respond_to :html, :json

  def index
    @employees = Employee.all
    respond_with(@employees) 
#    respond_to do |format|
 #     format.html # index.html.erb
  #    format.json { render json: @employees }
  #  end
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
 #   respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @employee }
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
 #   respond_to do |format|
  #    format.html { redirect_to employees_url }
   #   format.json { head :no_content }
   # end
  end
end