FactoryBot.define do
  factory :news do
    description { Faker::Lorem.paragraph }
  end
end