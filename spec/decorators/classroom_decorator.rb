require 'rails_helper'

describe ClassroomDecorator do
  let(:classroom){ FactoryGirl.create :classroom }
  subject{ classroom.decorate }

  describe '#building_name' do
    it{ expect(subject.building_name).to eql(classroom.building.name) }
  end
end
