FactoryGirl.define do
  factory :building do
    sequence(:name) { |n| "Building #{n}" }
  end
end
