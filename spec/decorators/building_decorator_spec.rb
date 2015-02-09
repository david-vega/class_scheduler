require 'rails_helper'

describe BuildingDecorator do
  let(:building){ FactoryGirl.create :building }
  subject{ building.decorate }

  describe '#classroom_names' do
    it{ expect(subject.classroom_names).to eql(building.classrooms.map(&:name).sort) }
  end
end
