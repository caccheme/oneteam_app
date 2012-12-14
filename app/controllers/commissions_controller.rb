class CommissionsController < ApplicationController
  def index

 #   @response = Response.find(params[Request.find(params[:request_id]).response_id])
 #   @response = Response.find(params[:response_id, :value => Request.find(params[:request_id]).response_id])
 #   @response = Response.find(params => {Request.find(params[:request_id]) => response_id})
 #   @response = Response.find(params[:response_id])
 #  @commissions = @response.commissions
    @commissions = Commission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @commissions }
    end
  end

  def show
    @response = Response.find(params[:response_id])
    @commission = @response.commission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @commission }
    end
  end

  def new
    @response = Response.find(params[:response_id])
    @commission = @response.commissions.build
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @commission }
    end
  end

  def edit
    @response = Response.find(params[:response_id])
    @commission = @response.commissions.find(params[:id])
  end

  def create
    @response = Response.find(params[:response_id])   
    @commission = @response.commissions.build(params[:commission])

    respond_to do |format|
      if @commission.save
  #      format.html { redirect_to response_commissions_path(commission), notice: 'Commission was successfully created.' }
  #      format.json { render json: @commission, status: :created, location: @commission }

        format.html { redirect_to response_commissions_path(@commission.response_id), notice: 'Commission was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @commission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @response = Response.find(params[:response_id])
    @commission = @response.commissions.find(params[:id])

    respond_to do |format|
      if @commission.update_attributes(params[:commission])
        format.html { redirect_to response_commissions_path, notice: 'Commission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @commission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
#    @response = Response.find(params[:response_id])
 #   @commission = @response.commission.find(params[:id])
    
    @commission = Commission.find(params[:id])
    @commission.destroy

#response_commission_path(@commission.response_id, @commission.id)

    respond_to do |format|
      format.html { redirect_to commissions_url }
      format.json { head :no_content }
    end
  end
end
