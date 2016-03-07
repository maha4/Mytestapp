class ActivitiesController < ApplicationController
  respond_to :json
  before_action :set_params, only: [:edit, :show,:destroy, :update]

  def index
    @activities=Activity.all
    authorize! :index, @activity
  end


  def show
  end

  def new
    @activity=Activity.new
  end

  def edit
  end

  def create
    @activity=Activity.create(activity_params)
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }

      format.json { head :no_content }
    end
  end
  private
  def set_params
    @activity=Activity.find(params[:id])
  end
  def activity_params
    params.require(:activity).permit(:name, :description, :lat_long, :avatar)
  end
end

