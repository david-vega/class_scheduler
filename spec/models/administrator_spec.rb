require 'rails_helper'

describe Administrator do
  subject{ FactoryGirl.create :administrator }

  it{ expect(subject.kind_of? Administrator).to be_truthy }
end
