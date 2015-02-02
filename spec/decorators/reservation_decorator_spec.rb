require 'rails_helper'

describe ReservationDecorator do
  let(:reservation){ FactoryGirl.create :reservation }
  let(:date_format){ '%Y/%m/%d %H:%M' }
  subject{ reservation.decorate }

  describe '#user_email' do
    it{ expect( subject.user_email ).to eql(reservation.user.email) }
  end

  describe '#start' do
    it{ expect( subject.start ).to eql(reservation.start_time.strftime(date_format)) }
  end

  describe '#end' do
    it{ expect( subject.end ).to eql(reservation.end_time.strftime(date_format)) }
  end
end
