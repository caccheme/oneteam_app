class RequestsController < ApplicationController
 respond_to :html, :json
 #before_filter :check_enddate

  def index
    @requests = Request.where("status = 'open'").where("end_date >= ?", Date.today).page(params[:page]).per(5)
#    @requests = Request.order(:id).page(params[:page]).per(5)
  end

  def show
    @request = Request.find(params[:id])
    respond_with(@request)
  end

  def new
    @request = Request.new
    respond_with(@request)
  end

  def edit   
    @request = Request.find(params[:id])

#    if Employee.find(session[:employee_id]).id = @request.find(session[:employee_id]).employee_id
#      render 'edit'
#    else
#      put "You are not the owner of this request"
#    end
  end

  def create
    @request = Request.new(params[:request])

    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_url, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new"}
        format.json { render json: @request.errors, status: :unprocessable_entity }        
      end
    end
  end

  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    respond_with(@request)
  end
end