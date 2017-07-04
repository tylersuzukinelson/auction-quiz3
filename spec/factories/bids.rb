FactoryGirl.define do
  factory :bid do
    association :user, factory: :user
    association :auction, factory: :auction
    bid 50
  end
end
