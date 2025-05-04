FactoryBot.define do
  factory :car_brand do
    sequence(:brand_id) { |n| "brand_#{n}" }
    sequence(:name) { |n| "Brand #{n}" }
  end
end
