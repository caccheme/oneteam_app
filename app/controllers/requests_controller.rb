class RequestsController < ApplicationController
#before_filter :authorize, :except => :index
respond_to :html, :json

  def index
 #   @requests = Request.where("status LIKE ?", "%#{params[:search]}%").page(params[:page]).per(4)
     @requests = Request.order("id").page(params[:page]).per(5)    
 #   @requests = Request.find(:all)
 #   @date = params[:month] ? Date.parse(params[:month]) : Date.today
#    @requests = Request.where(:status.matches => 'open')
#    @requests = Request.all
#    respond_with(@requests)
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
