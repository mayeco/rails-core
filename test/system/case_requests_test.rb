require "application_system_test_case"

class CaseRequestsTest < ApplicationSystemTestCase
  setup do
    @case_request = case_requests(:one)
  end

  test "visiting the index" do
    visit case_requests_url
    assert_selector "h1", text: "Case requests"
  end

  test "should create case request" do
    visit case_requests_url
    click_on "New case request"

    fill_in "Brand", with: @case_request.brand_id
    fill_in "Class", with: @case_request.class_id
    fill_in "Contact person email", with: @case_request.contact_person_email
    fill_in "Contact person name", with: @case_request.contact_person_name
    fill_in "Contact person phone", with: @case_request.contact_person_phone
    fill_in "Description", with: @case_request.description
    fill_in "End time", with: @case_request.end_time
    fill_in "Hours estimated", with: @case_request.hours_estimated
    fill_in "Location", with: @case_request.location
    fill_in "Model", with: @case_request.model_id
    fill_in "Model year", with: @case_request.model_year
    fill_in "Name", with: @case_request.name
    fill_in "Osm arrival date", with: @case_request.osm_arrival_date
    fill_in "Osm arrival time", with: @case_request.osm_arrival_time
    fill_in "Osm campaign", with: @case_request.osm_campaign
    fill_in "Osm campaign code", with: @case_request.osm_campaign_code
    fill_in "Osm color", with: @case_request.osm_color
    fill_in "Osm engine number", with: @case_request.osm_engine_number
    fill_in "Osm external ref", with: @case_request.osm_external_ref_id
    fill_in "Osm name arrival", with: @case_request.osm_name_arrival
    fill_in "Osm name order", with: @case_request.osm_name_order
    fill_in "Osm order date", with: @case_request.osm_order_date
    fill_in "Osm order time", with: @case_request.osm_order_time
    fill_in "Osm reference amount iva", with: @case_request.osm_reference_amount_iva
    fill_in "Osm special spare", with: @case_request.osm_special_spare
    fill_in "Osm stock", with: @case_request.osm_stock
    fill_in "Osmru t lcl", with: @case_request.osmru_t_lcl
    fill_in "Registration number", with: @case_request.registration_number
    fill_in "Replacement device", with: @case_request.replacement_device
    fill_in "Request", with: @case_request.request_id
    fill_in "Requested end date time", with: @case_request.requested_end_date_time
    fill_in "Requested start date time", with: @case_request.requested_start_date_time
    fill_in "Resource group", with: @case_request.resource_group
    fill_in "Resource personal number", with: @case_request.resource_personal_number
    fill_in "Service region", with: @case_request.service_region
    fill_in "Source", with: @case_request.source_id
    fill_in "Start time", with: @case_request.start_time
    fill_in "Status", with: @case_request.status
    fill_in "Usage qty", with: @case_request.usage_qty
    click_on "Create Case request"

    assert_text "Case request was successfully created"
    click_on "Back"
  end

  test "should update Case request" do
    visit case_request_url(@case_request)
    click_on "Edit this case request", match: :first

    fill_in "Brand", with: @case_request.brand_id
    fill_in "Class", with: @case_request.class_id
    fill_in "Contact person email", with: @case_request.contact_person_email
    fill_in "Contact person name", with: @case_request.contact_person_name
    fill_in "Contact person phone", with: @case_request.contact_person_phone
    fill_in "Description", with: @case_request.description
    fill_in "End time", with: @case_request.end_time.to_s
    fill_in "Hours estimated", with: @case_request.hours_estimated
    fill_in "Location", with: @case_request.location
    fill_in "Model", with: @case_request.model_id
    fill_in "Model year", with: @case_request.model_year
    fill_in "Name", with: @case_request.name
    fill_in "Osm arrival date", with: @case_request.osm_arrival_date.to_s
    fill_in "Osm arrival time", with: @case_request.osm_arrival_time.to_s
    fill_in "Osm campaign", with: @case_request.osm_campaign
    fill_in "Osm campaign code", with: @case_request.osm_campaign_code
    fill_in "Osm color", with: @case_request.osm_color
    fill_in "Osm engine number", with: @case_request.osm_engine_number
    fill_in "Osm external ref", with: @case_request.osm_external_ref_id
    fill_in "Osm name arrival", with: @case_request.osm_name_arrival
    fill_in "Osm name order", with: @case_request.osm_name_order
    fill_in "Osm order date", with: @case_request.osm_order_date.to_s
    fill_in "Osm order time", with: @case_request.osm_order_time.to_s
    fill_in "Osm reference amount iva", with: @case_request.osm_reference_amount_iva
    fill_in "Osm special spare", with: @case_request.osm_special_spare
    fill_in "Osm stock", with: @case_request.osm_stock
    fill_in "Osmru t lcl", with: @case_request.osmru_t_lcl
    fill_in "Registration number", with: @case_request.registration_number
    fill_in "Replacement device", with: @case_request.replacement_device
    fill_in "Request", with: @case_request.request_id
    fill_in "Requested end date time", with: @case_request.requested_end_date_time.to_s
    fill_in "Requested start date time", with: @case_request.requested_start_date_time.to_s
    fill_in "Resource group", with: @case_request.resource_group
    fill_in "Resource personal number", with: @case_request.resource_personal_number
    fill_in "Service region", with: @case_request.service_region
    fill_in "Source", with: @case_request.source_id
    fill_in "Start time", with: @case_request.start_time.to_s
    fill_in "Status", with: @case_request.status
    fill_in "Usage qty", with: @case_request.usage_qty
    click_on "Update Case request"

    assert_text "Case request was successfully updated"
    click_on "Back"
  end

  test "should destroy Case request" do
    visit case_request_url(@case_request)
    click_on "Destroy this case request", match: :first

    assert_text "Case request was successfully destroyed"
  end
end
