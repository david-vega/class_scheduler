FactoryGirl.define do
  factory :buildings do
    sequence(:name) { |n| "Building #{n}" }
  end
end
