FactoryGirl.define do
  factory :reservation do
    sequence(:name) { |n| "Anatomy #{n}" }
    start_time Time.now
    end_time Time.now + 1.hours

    association :user, factory: :super_user
    association :classroom
  end
end
