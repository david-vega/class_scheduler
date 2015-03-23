class Api::V1::SearchController < Api::V1::BaseController
  respond_to :json, :js
  before_filter :choose_search
  def index
    @search_results
  end
  
  private
    def choose_search
      case params[:search][:type]
      when 'classroom' then search_classroom
      when 'building' then search_building
      when 'user' then search_user
      when 'reservation' then search_reservation
      end
    end

    def search_classroom
      @search_results = Classroom.search(params[:search][:name]).decorate
    end

    def search_building
      @search_results = Building.search(params[:search][:name]).decorate
    end

    def search_user
      @search_results = User.search params[:search][:email]
    end

    def search_reservation
      @search_results = Reservation.search(params[:search]).decorate
    end
end
