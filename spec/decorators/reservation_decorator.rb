require 'rails_helper'

describe ReservationDecorator do
  let(:reservation){ FactoryGirl.create :reservation }
  subject{ reservation.decorate }

  describe '#user_email' do
    it{ expect( subject.user_email ).to eql(reservation.user.email) }
  end
end