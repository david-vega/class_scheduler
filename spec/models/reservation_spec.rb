require 'rails_helper'

describe Reservation do
  subject{ FactoryGirl.create :reservation }

  it{ expect{ subject.save! }.to_not raise_error }

  describe 'aasm machine' do
    context 'the initial state is reserved' do
      it { is_expected.to be_reserved }
    end

    context 'can be change to started' do
      before{ subject.start! }
      it{ is_expected.to be_started }
    end

    context 'can be change to finished' do
      before{ subject.finish! }
      it{ is_expected.to be_finished }
    end
  end
end
