class Api::V1::SearchController < Api::V1::BaseController
  def index
    @classroom = Classroom.search params[:search]
  end
end