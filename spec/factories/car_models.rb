FactoryBot.define do
  factory :car_model do
    sequence(:model_id) { |n| "model_#{n}" }
    sequence(:name) { |n| "Model #{n}" }
    sequence(:brand_id) { |n| "brand_#{n}" }
    sequence(:class_id) { |n| "class_#{n}" }
    sequence(:opr_model_id) { |n| "opr_model_#{n}" }
    
    association :car_brand
    association :car_class
  end
end
