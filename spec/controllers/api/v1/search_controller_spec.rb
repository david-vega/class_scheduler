require 'rails_helper'

describe Api::V1::SearchController do
  render_views
  let(:user){ FactoryGirl.create :user }
  let!(:building){ FactoryGirl.create :building }
  let!(:classroom){ FactoryGirl.create :classroom }
  let!(:user){ FactoryGirl.create :user }
  let(:response_keys_classroom){ %w(id name state building_id) }
  let(:response_keys_building){ %w(id name state classroom_names) }
  let(:response_keys_user){ %w(id email) }
  before{ sign_in user }

  describe 'GET index classroom' do
    let(:params){ { search: {name: 'room',type: 'classroom'}, format: :json } }
    before{ get :index, params }

    it{ expect(response).to be_success }
    it{ expect(assigns(:search_results).first).to eq(classroom) }
    it{ expect(JSON.parse(response.body).first.keys).to eq response_keys_classroom }
  end
  describe 'GET index building' do
    let(:params){ { search: {name: 'Build',type: 'building'}, format: :json } }
    before{ get :index, params }

    it{ expect(response).to be_success }
    it{ expect(assigns(:search_results).first).to eq(building) }
    it{ expect(JSON.parse(response.body).first.keys).to eq response_keys_building }
  end
  describe 'GET index user' do
    let(:params){ { search: {email: 'person',type: 'user'}, format: :json } }
    before{ get :index, params }

    it{ expect(response).to be_success }
    it{ expect(assigns(:search_results).first).to eq(user) }
    it{ expect(JSON.parse(response.body).first.keys).to eq response_keys_user }
  end
end
