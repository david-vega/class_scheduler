class ClassroomDecorator < Draper::Decorator
  delegate_all

  def building_name
    building.name
  end
end
