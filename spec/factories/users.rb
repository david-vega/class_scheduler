FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'qwerty123'
  end

  factory :super_user, class: SuperUser, parent: :user do
    type 'SuperUser'
  end
end
