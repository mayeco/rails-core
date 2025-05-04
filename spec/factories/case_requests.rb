FactoryBot.define do
  factory :case_request do
    sequence(:request_id) { |n| "request_#{n}" }
    
    start_time { Time.current }
    end_time { 2.hours.from_now }
    
    sequence(:brand_id) { |n| "brand_#{n}" }
    sequence(:class_id) { |n| "class_#{n}" }
    sequence(:model_id) { |n| "model_#{n}" }
    
    sequence(:contact_person_email) { |n| "person#{n}@example.com" }
    sequence(:contact_person_name) { |n| "Person #{n}" }
    sequence(:contact_person_phone) { |n| "+1234567890#{n}" }
    
    description { "Service request description" }
    hours_estimated { 2 }
    location { "Service Center" }
    model_year { 2025 }
    name { "Service Request" }
    
    registration_number { "REG-12345" }
    replacement_device { false }
    resource_group { "Group A" }
    resource_personal_number { "PN-67890" }
    service_region { "Region 1" }
    source_id { "src-123" }
    status { "pending" }
    usage_qty { 1 }
  end
end
