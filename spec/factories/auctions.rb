FactoryGirl.define do
  factory :auction do
    association :user, factory: :user
    sequence(:title) { |n| Faker::Commerce.product_name + "#{n}"}
    details Faker::Hipster.paragraph
    reserve_price 500
    current_price 1
    aasm_state 'draft'
    end_date {Date.today + rand(100)}

  end
end
