require 'rails_helper'

describe ClassroomDecorator do
  let(:reservation){ FactoryGirl.create :reservation }
  let(:classroom){ reservation.classroom }
  subject{ classroom.decorate }

  describe '#building_name' do
    it{ expect(subject.building_name).to eql(classroom.building.name) }
  end

  describe '#current_reservations' do
    let(:result){ "#{reservation.name}: starts: #{reservation.start_time.strftime('%d-%m-%Y %H:%M')}, ends: #{reservation.end_time.strftime('%d-%m-%Y %H:%M')}" }
    it{ expect(subject.current_reservations.first).to eql result }
  end
end
