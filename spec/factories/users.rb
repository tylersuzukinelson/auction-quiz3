FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    sequence(:email) { |n| Faker::Internet.email.gsub('@', "-#{n}@")}
    password '123'
  end
end
