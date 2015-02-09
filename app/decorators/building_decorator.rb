class BuildingDecorator < Draper::Decorator
  delegate_all

  def classroom_names
    classrooms.map(&:name).sort
  end
end
