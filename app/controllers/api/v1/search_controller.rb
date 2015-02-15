class Api::V1::SearchController < Api::V1::BaseController
  respond_to :json, :js
  def index
    @classrooms = Classroom.search params[:search]
  end
end