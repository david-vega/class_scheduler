require 'rails_helper'

describe ClassSchedulerController do
  describe 'GET index' do
    let(:user){ FactoryGirl.create :user }

    subject { get :index }

    context 'when the user exist' do
      before{ sign_in user }

      it{ expect(subject).to be_success }
      it{ expect(subject).to render_template(:index) }
    end

    context 'when the user does not exist' do
      it{ expect(subject).to_not be_success }
      it{ expect(subject).to redirect_to '/users/sign_in' }
    end
  end
end
