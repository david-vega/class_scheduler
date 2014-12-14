require 'rails_helper'

describe Api::V1::ClassRoomsController do
  render_views

  let(:user){ FactoryGirl.create :user }
  let!(:class_room){ FactoryGirl.create :class_room }

  before{ sign_in user }

  describe 'GET index' do
    before{get :index, format: :json}

    it { expect(response).to be_success }
    it{ expect(assigns(:class_rooms).first).to eq(class_room) }
    it{ expect(JSON.parse(response.body).first.keys).to eq ['id', 'name', 'state'] }
  end
end