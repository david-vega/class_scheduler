FactoryGirl.define do
  factory :reservation do
    name 'anatomy class 1'
    start_time Time.now
    end_time Time.now + 1.hours

    association :user, factory: :super_user
    association :class_room
  end
end
