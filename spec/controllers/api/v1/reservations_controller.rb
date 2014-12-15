require 'rails_helper'

describe Api::V1::ReservationsController do
  render_views

  let(:reservation){ FactoryGirl.create :reservation }
  let(:user){ reservation.user }
  let(:class_room){ reservation.class_room }

  before{ sign_in user }

  describe 'GET show' do
    before{ get :show, { format: :json, id: reservation.id } }

    it{ expect(response).to be_success }
    it{ expect(assigns(:reservation)).to eq(reservation) }
    it{ expect(JSON.parse(response.body).keys).to eq  ['id', 'name', 'start_time', 'end_time', 'user_id', 'class_room_id'] }
  end
end
