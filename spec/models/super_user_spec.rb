require 'rails_helper'

describe SuperUser do
  subject{ FactoryGirl.create :super_user }

  it{ expect(subject.kind_of? SuperUser).to be_truthy }
end
