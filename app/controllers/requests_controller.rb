class RequestsController < ApplicationController
 respond_to :html, :json
 before_filter :signed_in_employee
 before_filter :check_for_cancel, :only => [:create, :update]


  def my_requests
    @requests = Request.find_all_by_employee_id(current_employee)
  end

  def requests_calendar
    @requests = Request.order(:id).page(params[:page]).per(5)
    @requests_by_date = @requests.group_by(&:start_date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def my_requests_calendar
    @requests = Request.order(:id).page(params[:page]).per(5)
    @requests_by_date = @requests.group_by(&:start_date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def index
    @requests = Request.order(:id).page(params[:page]).per(5)
  end

  def show
    @request = Request.find(params[:id])
    
    respond_with(@request)
  end

  def new
    @request = Request.new
    @skills = Skill.all  

    respond_with(@request)
  end

  def edit 
    @request = Request.find(params[:id])
    @skills = Skill.all

    relevant_skills = params[:relevant_skills]

    if !params[:relevant_skills].nil?
      relevant_skills = @request.relevant_skills.split(", ")
    end

  end

  def create
    @request = current_employee.requests.build(params[:request])
    @skills = Skill.all 

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new"}
        format.json { render json: @request.errors, status: :unprocessable_entity }        
      end
    end
  end

  def update
    @request = Request.find(params[:id])
    @skills = Skill.all

    @request.relevant_skills = params[:relevant_skills].to_a
    @request.relevant_skills = @request.relevant_skills.join(", ")

    if @request.update_attributes(params[:request])
     flash[:success] = "Request updated"
     redirect_to @request
    else
     render 'edit'
    end
  end 

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    respond_with(@request)
  end
end
