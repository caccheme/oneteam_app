class RequestsController < ApplicationController
respond_to :html, :json

  def index
    @requests = Request.all
    respond_with(@requests)
 #   respond_to do |format|
  #    format.html # index.html.erb
   #   format.json { render json: @requests }
  #  end
  end

  def show
    @request = Request.find(params[:id])
    respond_with(@request)
#    respond_to do |format|
 #     format.html # show.html.erb
  #    format.json { render json: @request }
 #   end
  end

  def new
    @request = Request.new
    respond_with(@request)
#    respond_to do |format|
 #     format.html # new.html.erb
  #    format.json { render json: @request }
   # end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def create
    @request = Request.new(params[:request])

    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_url, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
#        redirect_to requests_url, notice: 'Request was successfully created.'
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
#    respond_to do |format|
 #     format.html { redirect_to requests_url }
  #    format.json { head :no_content }
#    end
  end
end
