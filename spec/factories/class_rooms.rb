FactoryGirl.define do
  factory :class_room do
    sequence(:name) { |n| "Class Room #{n}" }
  end
end
