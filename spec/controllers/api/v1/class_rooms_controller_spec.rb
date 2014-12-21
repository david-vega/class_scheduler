require 'rails_helper'

describe Api::V1::ClassroomsController do
  render_views

  let(:user){ FactoryGirl.create :user }
  let!(:classroom){ FactoryGirl.create :classroom }

  before{ sign_in user }

  describe 'GET index' do
    before{ get :index, format: :json }

    it{ expect(response).to be_success }
    it{ expect(assigns(:classrooms).first).to eq(classroom) }
    it{ expect(JSON.parse(response.body).first.keys).to eq ['id', 'name', 'state'] }
  end

  describe 'GET show' do
    before{ get :show, { format: :json, id: classroom.id } }

    it{ expect(response).to be_success }
    it{ expect(assigns(:classroom)).to eq(classroom) }
    it{ expect(JSON.parse(response.body).keys).to eq ['id', 'name', 'state'] }
  end

  describe 'POST create' do
    let(:params){ { classroom: { name: 'Classroom Test' }, format: :json } }
    before{ post :create, params }

    it{ expect(response).to be_success }
    it{ expect(assigns(:classroom).name).to eq 'Classroom Test' }
    it{ expect(JSON.parse(response.body).keys).to eq ['id', 'name', 'state'] }
  end

  describe 'PUT update' do
    let(:params){ { id: classroom.id, classroom: { name: 'Classroom Test' }, format: :json } }
    before{ put :update, params }

    it{ expect(response).to be_success }
    it{ expect([assigns(:classroom).name, assigns(:classroom).id]).to eq ['Classroom Test', classroom.id] }
    it{ expect(JSON.parse(response.body).keys).to eq ['id', 'name', 'state'] }
  end

  describe 'DELETE destroy' do
    let(:params){ { id: classroom.id, format: :json } }
    before{ delete :destroy, params }

    it{ expect(response).to be_success }
    it{ expect(Classroom.all.count).to eq 0 }
  end
end
