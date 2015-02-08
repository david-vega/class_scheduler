require 'rails_helper'

describe Api::V1::BuildingsController do
  render_views

  let(:user){ FactoryGirl.create :user }
  let!(:building){ FactoryGirl.create :building }

  before{ sign_in user }

  describe 'GET index' do
    before{ get :index, format: :json }

    it{ expect(response).to be_success }
    it{ expect(assigns(:buildings).first).to eq(building) }
    it{ expect(JSON.parse(response.body).first.keys).to eq ['id', 'name', 'state'] }
  end

  describe 'GET show' do
    before{ get :show, { format: :json, id: building.id } }

    it{ expect(response).to be_success }
    it{ expect(assigns(:building)).to eq(building) }
    it{ expect(JSON.parse(response.body).keys).to eq ['id', 'name', 'state'] }
  end

  describe 'POST create' do
    let(:params){ { building: { name: 'Building Test' }, format: :json } }
    before{ post :create, params }

    it{ expect(response).to be_success }
    it{ expect(assigns(:building).name).to eq 'Building Test' }
    it{ expect(JSON.parse(response.body).keys).to eq ['id', 'name', 'state'] }
  end

  describe 'PUT update' do
    let(:params){ { id: building.id, building: { name: 'Building Test' }, format: :json } }
    before{ put :update, params }

    it{ expect(response).to be_success }
    it{ expect([assigns(:building).name, assigns(:building).id]).to eq ['Building Test', building.id] }
    it{ expect(JSON.parse(response.body).keys).to eq ['id', 'name', 'state'] }
  end

  describe 'DELETE destroy' do
    let(:params){ { id: building.id, format: :json } }
    before{ delete :destroy, params }

    it{ expect(response).to be_success }
    it{ expect(Building.all.count).to eq 0 }
  end
end
