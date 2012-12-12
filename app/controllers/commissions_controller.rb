class CommissionsController < ApplicationController
  # GET /commissions
  # GET /commissions.json
  def index
    @response = Response.find(params[:response_id])
    @commissions = @response.commissions
  # @commissions = Commission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @commissions }
    end
  end

  # GET /commissions/1
  # GET /commissions/1.json
  def show
    @response = Response.find(params[:response_id])
    @commission = @response.commission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @commission }
    end
  end

  # GET /commissions/new
  # GET /commissions/new.json
  def new
    @response = Response.find(params[:response_id])
    @session = Employee.find(session[:employee_id])
    @commission = @response.commissions.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @commission }
    end
  end

  # GET /commissions/1/edit
  def edit
    @response = Response.find(params[:response_id])
    @commission = @response.commissions.find(params[:id])
  end

  # POST /commissions
  # POST /commissions.json
  def create
   @response = Response.find(params[:response_id])
   @session = Employee.find(session[:employee_id])
   @commission = @response.commissions.build(params[:commission])

    respond_to do |format|
      if @commission.save
        format.html { redirect_to @commission, notice: 'Commission was successfully created.' }
        format.json { render json: @commission, status: :created, location: @commission }
      else
        format.html { render action: "new" }
        format.json { render json: @commission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /commissions/1
  # PUT /commissions/1.json
  def update
    @response = Response.find(params[:response_id])
    @session = Employee.find(session[:employee_id])  
    @comission = @response.comissions.find(params[:id])

    respond_to do |format|
      if @commission.update_attributes(params[:commission])
        format.html { redirect_to @commission, notice: 'Commission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @commission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commissions/1
  # DELETE /commissions/1.json
  def destroy
    @response = Response.find(params[:response_id])
    @commission = @response.commissions.find(params[:id])
    @commission.destroy

    respond_to do |format|
      format.html { redirect_to commissions_url }
      format.json { head :no_content }
    end
  end
end
