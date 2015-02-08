require 'rails_helper'

describe ReservationDecorator do
  let(:reservation){ FactoryGirl.create :reservation }
  let(:date_format){ '%d/%m/%Y %H:%M' }
  subject{ reservation.decorate }

  describe '#start' do
    it{ expect( subject.start ).to eql(reservation.start_time.strftime(date_format)) }
  end

  describe '#end' do
    it{ expect( subject.end ).to eql(reservation.end_time.strftime(date_format)) }
  end
end
