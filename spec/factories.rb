FactoryBot.define do
  factory :leader do
    category { "MyString" }
    title { "MyString" }
    name { "MyString" }
    string { "MyString" }
    phone { "MyString" }
    email { "MyString" }
  end
  factory :teetime do
    team_tee_time { "MyText" }
    user_id { 1 }
  end
  factory :note do
    
  end

  factory :team do
    
  end

  factory :minute do
    title { 'Minute Title'}
    date { '2018-09-30' }
    pdf_file { 'pdf-file.pdf'}
    association :user
  end

  factory :photo do
    flight_winner { "" }
    winners_image { "" }
    which_flight { "MyString" }
  end

  factory :partner do
    
  end

  factory :registration do
  end

  factory :event do
    event_title { 'Test' }
    event_start_date { '2018-09-30' }
    event_cost_mcpla { 50 }
    event_cost_non_mcpla { 100 }
    event_cost_season_pass { 150 }
    event_location { 'Test location' }
    event_start_time { '2000-01-01 08:30:00' }
    registration_close { '1999-12-20 08:30:00' }
    association :user
  end

  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password { 'secretPassword' }
    password_confirmation { 'secretPassword' }
  end
end
