require 'rails_helper'

describe Api::V1::ReservationsController do
  render_views

  let(:reservation){ FactoryGirl.create :reservation }
  let(:user){ reservation.user }
  let(:classroom){ reservation.classroom }

  before{ sign_in user }

  describe 'GET index' do
    before{ get :index, format: :json }

    it{ expect(response).to be_success }
    it{ expect(assigns(:reservations).first).to eq(reservation) }
    it{ expect(JSON.parse(response.body).first.keys).to eq ['id', 'name', 'start_time', 'end_time', 'user_id', 'classroom_id'] }
  end


  describe 'GET show' do
    before{ get :show, { format: :json, id: reservation.id } }

    it{ expect(response).to be_success }
    it{ expect(assigns(:reservation)).to eq(reservation) }
    it{ expect(JSON.parse(response.body).keys).to eq  ['id', 'name', 'start_time', 'end_time', 'user_id', 'classroom_id'] }
  end

  describe 'POST create' do
    let(:params){ { reservation: { name: 'Reservation Test',
                                   start_time: Time.now.strftime('%F %X'),
                                   end_time:  (Time.now + 1.hours).strftime('%F %X'),
                                   classroom_id: classroom.id
                                  }, format: :json } }
    before{ post :create, params }

    it{ expect(response).to be_success }
    it{ expect(assigns(:reservation).name).to eq 'Reservation Test' }
    it{ expect(JSON.parse(response.body).keys).to eq ['id', 'name', 'start_time', 'end_time', 'user_id', 'classroom_id'] }
  end

  describe 'PUT update' do
    let(:params){ { id: reservation.id, reservation: { name: 'Reservation Test' }, format: :json } }
    before{ put :update, params }

    it{ expect(response).to be_success }
    it{ expect(assigns(:reservation).name).to eq 'Reservation Test' }
    it{ expect(JSON.parse(response.body).keys).to eq ['id', 'name', 'start_time', 'end_time', 'user_id', 'classroom_id'] }
  end

  describe 'DELETE destroy' do
    let(:params){ { id: reservation.id, format: :json } }
    before{ delete :destroy, params }

    it{ expect(response).to be_success }
    it{ expect(Reservation.all.count).to eq 0 }
  end
end
