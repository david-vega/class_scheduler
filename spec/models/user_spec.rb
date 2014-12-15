require 'rails_helper'

describe User do
  subject { FactoryGirl.create :user }

  it{ expect{ subject.save! }.to_not raise_error }
end
