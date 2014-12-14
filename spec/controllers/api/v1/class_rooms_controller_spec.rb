require 'rails_helper'

describe Api::V1::ClassRoomsController do
  render_views

  let(:user){ FactoryGirl.create :user }
  let!(:class_room){ FactoryGirl.create :class_room }

  before{ sign_in user }

  describe 'GET index' do
    before{ get :index, format: :json }

    it{ expect(response).to be_success }
    it{ expect(assigns(:class_rooms).first).to eq(class_room) }
    it{ expect(JSON.parse(response.body).first.keys).to eq ['id', 'name', 'state'] }
  end

  describe 'GET show' do
    before{ get :show, { format: :json, id: class_room.id } }

    it{ expect(response).to be_success }
    it{ expect(assigns(:class_room)).to eq(class_room) }
    it{ expect(JSON.parse(response.body).keys).to eq ['id', 'name', 'state'] }
  end

  describe 'POST create' do
    let(:params){ { class_room: { name: 'ClassRoom Test' }, format: :json } }
    before{ post :create, params }

    it{ expect(response).to be_success }
    it{ expect(assigns(:class_room).name).to eq 'ClassRoom Test' }
    it{ expect(JSON.parse(response.body).keys).to eq ['id', 'name', 'state'] }
  end

  describe 'PUT update' do
    let(:params){ { id: class_room.id, class_room: { name: 'ClassRoom Test' }, format: :json } }
    before{ put :update, params }

    it{ expect(response).to be_success }
    it{ expect([assigns(:class_room).name, assigns(:class_room).id]).to eq ['ClassRoom Test', class_room.id] }
    it{ expect(JSON.parse(response.body).keys).to eq ['id', 'name', 'state'] }
  end

  describe 'DELETE destroy' do
    let(:params){ { id: class_room.id, format: :json } }
    before{ delete :destroy, params }

    it{ expect(response).to be_success }
    it{ expect(ClassRoom.all.count).to eq 0 }
  end
end