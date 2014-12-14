require 'rails_helper'

describe Api::V1::ClassRoomsController do
  render_views

  let(:user){ FactoryGirl.create :user }
  let!(:class_room){ FactoryGirl.create :class_room }

  before{ sign_in user }

  describe 'GET index' do
    it 'returns al class_rooms' do
      get :index, format: :json
      response.should be_success
      assigns(:class_rooms).first.should eq(class_room)
      JSON.parse(response.body).first.keys.should eq ['id', 'name', 'state']
    end
  end
end