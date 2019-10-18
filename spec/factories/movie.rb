FactoryBot.define do
  factory :movie do
    name { Faker::Movies::HarryPotter.book }
    release_date { Faker::Date.in_date_period }
    image { '' }
  end
end