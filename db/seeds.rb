20.times do
  FactoryGirl.create :reservation
end

FactoryGirl.create :super_user,
                   email: 'test@example.com',
                   password: 'qwerty123'
