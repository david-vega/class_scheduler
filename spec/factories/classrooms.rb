FactoryGirl.define do
  factory :classroom do
    sequence(:name) { |n| "Classroom #{n}" }

    association :buildings
  end
end
