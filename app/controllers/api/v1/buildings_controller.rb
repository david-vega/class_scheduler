class Api::V1::BuildingsController < Api::V1::BaseController
  respond_to :json, :js

  before_action :find_building, only: [:show, :update, :destroy]

  def index
    @buildings = Building.all.decorate
  end

  def show
    @building
  end

  def create
    @building = Building.create!(building_params).decorate
  end

  def update
    @building.update(building_params)
  end

  def destroy
    respond_with status: @building.destroy ? :ok : :unprocessable_entity
  end

  private
  def find_building
    @building = Building.find(params[:id]).decorate
  end

  def building_params
    params.require(:building).permit(:name, :state)
  end
end
