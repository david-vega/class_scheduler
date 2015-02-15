class Api::V1::SearchController < Api::V1::BaseController
  def search
    @classroom = Classroom.search params[:search]
  end
end