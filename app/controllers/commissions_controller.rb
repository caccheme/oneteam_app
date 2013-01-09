class CommissionsController < ApplicationController
  before_filter :correct_user, only: [:edit, :update, :destroy]
  def index
    @commissions = Commission.order(:request_id).page(params[:page]).per(5)

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
         format.html { redirect_to edit_request_path(@response.request_id), :notice => 'Successfully created commission, please update request status.' }
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
    @commission = Commission.find(params[:id])
    @commission.destroy

    respond_to do |format|
      format.html { redirect_to commissions_url }
      format.json { head :no_content }
    end
  end
end
