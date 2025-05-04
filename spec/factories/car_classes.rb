FactoryBot.define do
  factory :car_class do
    sequence(:class_id) { |n| "class_#{n}" }
    sequence(:name) { |n| "Class #{n}" }
    
    association :car_brand

    # Asignar brand_id desde car_brand
    after(:build) do |car_class, evaluator|
      car_class.brand_id = car_class.car_brand.brand_id if car_class.car_brand
    end
  end
end
