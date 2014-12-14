require 'rails_helper'

describe User do
  subject { FactoryGirl.create :user }

  it 'create a new user' do
    expect{ subject.save! }.to_not raise_error
  end
end