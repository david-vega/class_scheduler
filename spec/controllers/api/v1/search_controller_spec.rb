require 'rails_helper'

describe Api::V1::SearchController do
  render_views
  let(:user){ FactoryGirl.create :user }
  let!(:classroom){ FactoryGirl.create :classroom }
  let(:response_keys){ %w(id name state building_id) }
  before{ sign_in user }

  describe 'GET index' do
    let(:params){ { search: 'room', format: :json } }
    before{ get :index, params }

    it{ expect(response).to be_success }
    it{ expect(assigns(:classrooms).first).to eq(classroom) }
    it{ expect(JSON.parse(response.body).first.keys).to eq response_keys }
  end
end
