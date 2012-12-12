class ResponsesController < ApplicationController

  def index
    @request = Request.find(params[:request_id])
    @responses = @request.responses

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responses }
    end
  end

  def show
    @request = Request.find(params[:request_id])
    @response = Response.find(params[:id])
#    @commission = @response.commission.find(params[:id])

      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @response }
    end
  end

  def new
    @request = Request.find(params[:request_id])
    @session = Employee.find(session[:employee_id])
    @response = @request.responses.build
#    @commission = @response.commissions.build


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @response }
    end
  end

  def create
   @request = Request.find(params[:request_id])
   @session = Employee.find(session[:employee_id])
   @response = @request.responses.build(params[:response])
#   @commission = @response.commissions.build(params[:commission])

    respond_to do |format|
      if @response.save
     #   flash[:notice] = "Successfully created response." 
        format.html { redirect_to request_responses_path @request, notice: 'Response successfully created'} 
    #    format.html { redirect_to request_responses_path(@request, @response) }   
    #    format.json { render json: @response, status: :created, location: @response }
      else
       format.html { render :action => 'new'}
       format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end

#    respond_to do |format|
#      if @response.submit = true
#        format.html { redirect_to request_response_match_path @response, notice: 'Match successfully created'}
#      else
#        nil
#      end
#    end
  end

  def edit
    @request = Request.find(params[:request_id])
    @response = @request.responses.find(params[:id])
#    @commission = @response.commissions.find(params[:id])
  end

  def update
    @request = Request.find(params[:request_id])
    @session = Employee.find(session[:employee_id])  
    @response = @request.responses.find(params[:id])
    if @response.update_attributes(params[:response])
      flash[:notice] = "Successfully updated response."
      redirect_to request_response_url(@response.request_id)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @request = Request.find(params[:request_id])
    @response = @request.responses.find(params[:id])
#    @commission = @response.commissions.find(params[:id])
    @response.destroy

    flash[:notice] = "Successfully destroyed comment."
    redirect_to request_responses_url(@response.request_id)
  end

#  def submit
#    @request = Request.find(params[:request_id])
#    @response = @request.responses.find(params[:id])

#    if @response.submit(params[:response])
#      flash[:notice] = "Successfully selected developer."
#      redirect_to request_response_url(@response.request_id)
#    else
#      render :action => 'edit'
#    end
#  end

end