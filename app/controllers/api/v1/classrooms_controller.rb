class Api::V1::ClassroomsController < Api::V1::BaseController
  respond_to :json, :js

  before_action :find_classroom, only: [:show, :update, :destroy]

  def index
    @classrooms = Classroom.where(building_id: params[:building_id])
  end

  def show
    @classroom
  end

  def create
    @classroom = Classroom.create!(classroom_params)
  end

  def update
    @classroom.update(classroom_params)
  end

  def destroy
    respond_with status: @classroom.destroy ? :ok : :unprocessable_entity
  end

  private
    def find_classroom
      @classroom = Classroom.find(params[:id])
    end

    def classroom_params
      params.require(:classroom).permit(:name, :state, :building_id)
    end
end
