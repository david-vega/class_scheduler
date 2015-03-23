require 'rails_helper'

describe Api::V1::ClassroomsController do
  render_views

  let(:user){ FactoryGirl.create :user }
  let!(:classroom){ FactoryGirl.create :classroom }
  let!(:building){ classroom.building }
  let(:response_keys){ %w(id name state building_id building_name) }

  before{ sign_in user }

  describe 'GET index' do
    let(:params){ { building_id: building.id, format: :json } }
    before{ get :index, params }

    it{ expect(response).to be_success }
    it{ expect(assigns(:classrooms).first).to eq(classroom) }
    it{ expect(JSON.parse(response.body).first.keys).to eq response_keys }
  end

  describe 'GET show' do
    before{ get :show, { format: :json, id: classroom.id } }

    it{ expect(response).to be_success }
    it{ expect(assigns(:classroom)).to eq(classroom) }
    it{ expect(JSON.parse(response.body).keys).to eq response_keys }
  end

  describe 'POST create' do
    let(:params){ { classroom: { name: 'Classroom Test', building_id: building.id }, format: :json } }
    before{ post :create, params }

    it{ expect(response).to be_success }
    it{ expect(assigns(:classroom).name).to eq 'Classroom Test' }
    it{ expect(JSON.parse(response.body).keys).to eq response_keys }
  end

  describe 'PUT update' do
    let(:params){ { id: classroom.id, classroom: { name: 'Classroom Test' }, format: :json } }
    before{ put :update, params }

    it{ expect(response).to be_success }
    it{ expect([assigns(:classroom).name, assigns(:classroom).id]).to eq ['Classroom Test', classroom.id] }
    it{ expect(JSON.parse(response.body).keys).to eq response_keys }
  end

  describe 'DELETE destroy' do
    let(:params){ { id: classroom.id, format: :json } }
    before{ delete :destroy, params }

    it{ expect(response).to be_success }
    it{ expect(Classroom.all.count).to eq 0 }
  end
end
