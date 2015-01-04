class Api::V1::ReservationsController < Api::V1::BaseController
  respond_to :json, :js

  before_action :find_reservation, only: [:show, :update, :destroy]

  def index
    @reservations = Reservation.where(classroom_id: params[:classroom_id])
  end

  def show
    @reservation
  end

  def create
    @reservation = Reservation.create!(reservation_params)
  end

  def update
    @reservation.update(reservation_params)
  end

  def destroy
    respond_with status: @reservation.destroy ? :ok : :unprocessable_entity
  end

  private
    def find_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params[:reservation][:user_id] = current_user.id
      params.require(:reservation).permit(:name, :user_id, :classroom_id, :start_time, :end_time)
    end
end
