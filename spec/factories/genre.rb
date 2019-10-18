FactoryBot.define do
  factory :genre do
    name { Faker::Movies::HarryPotter.book }
  end
end