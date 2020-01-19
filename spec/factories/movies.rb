FactoryBot.define do
  factory :movie do
    name { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    poster { Faker::Internet.url }
    association :user, factory: :user
  end
end
