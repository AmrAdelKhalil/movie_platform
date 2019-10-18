FactoryBot.define do
  factory :rating do
    rate { (0..5).to_a.sample }
    user
    movie
  end
end