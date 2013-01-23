class EmployeesController < ApplicationController
respond_to :html, :json
before_filter :signed_in_employee, only: [:edit, :update, :index]
before_filter :current_employee
before_filter :check_for_cancel, :only => [:create, :update]

  def index
    @employees = Employee.order(:id).page(params[:page]).per(10)
    respond_with(@employees)
  end

  def show
    @employee = Employee.find(params[:id])
    @commissions = Commission.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  def new
    @employee = Employee.new
    @current_skills = params[:current_skills]
    @desired_skills = params[:desired_skills]

    if !params[:current_skills].nil?
      current_skill = @employee.current_skill.split(", ")
    end

   skills_interested_in = params[:desired_skills]

   if !params[:desired_skills].nil?
     skills_interested_in = @employee.skills_interested_in.split(", ")
   end

    respond_with(@employee)
  end

  def edit
    @employee = Employee.find(params[:id])

   current_skill = params[:current_skill]

    if !params[:current_skill].nil?
      current_skill = @employee.current_skill.split(", ")
    end

   desired_skills = params[:desired_skills]

   if !params[:desired_skills].nil?
     desired_skills = @employee.desired_skills.split(", ")
   end
  end

  def create
    @employee = Employee.new(params[:employee])

    @employee.current_skills = params[:current_skills].to_a
    @employee.current_skills = @employee.current_skills.join(", ")
   
    @employee.desired_skills = params[:desired_skilss].to_a
    @employee.desired_skills = @employee.desired_skills.join(", ")

    if @employee.save
      flash[:notice] = "Successfully created account profile."
      redirect_to root_url, :notice => "Your account was created. Sign in!"
    else
      render "new"
    end
  end

  def update
    @employee = Employee.find(params[:id])

    @employee.current_skill = params[:current_skill].to_a
    @employee.current_skill = @employee.current_skill.join(", ")
   
    @employee.desired_skills = params[:desired_skilss].to_a
    @employee.desired_skills = @employee.desired_skills.join(", ")

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to @employee, notice: 'Employee profile was successfully updated.' }
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