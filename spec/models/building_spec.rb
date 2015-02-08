require 'rails_helper'

describe Building do
  subject { FactoryGirl.create :buildings }

  it{ expect{ subject.save! }.to_not raise_error }

  describe 'aasm machine' do
    context 'the initial state is opened' do
      it { is_expected.to be_opened }
    end

    context 'can be change to closed' do
      before{ subject.close! }
      it{ is_expected.to be_closed }
    end
  end

  describe 'validations' do
    context ' the name presence is required' do
      it{ expect(Building.new).to_not be_valid }
    end

    context ' the name has to be unique' do
      it{ expect(Building.new(name: subject.name)).to_not be_valid }
    end
  end
end
