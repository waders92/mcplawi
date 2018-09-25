FactoryGirl.define do
  factory :registration do
  end
  factory :event do
    event_title 'Test'
    event_date '2018-09-30'
    event_cost '50'
    event_location 'Test location'
    event_start_time '2000-01-01 08:30:00'
    association :user
  end
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password 'secretPassword'
    password_confirmation 'secretPassword'
  end
end
