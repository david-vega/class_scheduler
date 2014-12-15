class Api::V1::ClassRoomsController <Api::V1::BaseController
  respond_to :json, :js

  before_action :find_class_room, only: [:show, :update, :destroy]

  def index
    @class_rooms = ClassRoom.all
  end

  def show
    @class_room
  end

  def create
    @class_room = ClassRoom.create!(class_room_params)
  end

  def update
    @class_room.update(class_room_params)
  end

  def destroy
    respond_with status: @class_room.destroy ? :ok : :unprocessable_entity
  end

  private
    def find_class_room
      @class_room = ClassRoom.find(params[:id])
    end

    def class_room_params
      params.require(:class_room).permit(:name, :state)
    end
end
