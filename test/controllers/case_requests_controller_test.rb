require "test_helper"

class CaseRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @case_request = case_requests(:one)
  end

  test "should get index" do
    get case_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_case_request_url
    assert_response :success
  end

  test "should create case_request" do
    assert_difference("CaseRequest.count") do
      post case_requests_url, params: { case_request: { brand_id: @case_request.brand_id, class_id: @case_request.class_id, contact_person_email: @case_request.contact_person_email, contact_person_name: @case_request.contact_person_name, contact_person_phone: @case_request.contact_person_phone, description: @case_request.description, end_time: @case_request.end_time, hours_estimated: @case_request.hours_estimated, location: @case_request.location, model_id: @case_request.model_id, model_year: @case_request.model_year, name: @case_request.name, osm_arrival_date: @case_request.osm_arrival_date, osm_arrival_time: @case_request.osm_arrival_time, osm_campaign: @case_request.osm_campaign, osm_campaign_code: @case_request.osm_campaign_code, osm_color: @case_request.osm_color, osm_engine_number: @case_request.osm_engine_number, osm_external_ref_id: @case_request.osm_external_ref_id, osm_name_arrival: @case_request.osm_name_arrival, osm_name_order: @case_request.osm_name_order, osm_order_date: @case_request.osm_order_date, osm_order_time: @case_request.osm_order_time, osm_reference_amount_iva: @case_request.osm_reference_amount_iva, osm_special_spare: @case_request.osm_special_spare, osm_stock: @case_request.osm_stock, osmru_t_lcl: @case_request.osmru_t_lcl, registration_number: @case_request.registration_number, replacement_device: @case_request.replacement_device, request_id: @case_request.request_id, requested_end_date_time: @case_request.requested_end_date_time, requested_start_date_time: @case_request.requested_start_date_time, resource_group: @case_request.resource_group, resource_personal_number: @case_request.resource_personal_number, service_region: @case_request.service_region, source_id: @case_request.source_id, start_time: @case_request.start_time, status: @case_request.status, usage_qty: @case_request.usage_qty } }
    end

    assert_redirected_to case_request_url(CaseRequest.last)
  end

  test "should show case_request" do
    get case_request_url(@case_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_case_request_url(@case_request)
    assert_response :success
  end

  test "should update case_request" do
    patch case_request_url(@case_request), params: { case_request: { brand_id: @case_request.brand_id, class_id: @case_request.class_id, contact_person_email: @case_request.contact_person_email, contact_person_name: @case_request.contact_person_name, contact_person_phone: @case_request.contact_person_phone, description: @case_request.description, end_time: @case_request.end_time, hours_estimated: @case_request.hours_estimated, location: @case_request.location, model_id: @case_request.model_id, model_year: @case_request.model_year, name: @case_request.name, osm_arrival_date: @case_request.osm_arrival_date, osm_arrival_time: @case_request.osm_arrival_time, osm_campaign: @case_request.osm_campaign, osm_campaign_code: @case_request.osm_campaign_code, osm_color: @case_request.osm_color, osm_engine_number: @case_request.osm_engine_number, osm_external_ref_id: @case_request.osm_external_ref_id, osm_name_arrival: @case_request.osm_name_arrival, osm_name_order: @case_request.osm_name_order, osm_order_date: @case_request.osm_order_date, osm_order_time: @case_request.osm_order_time, osm_reference_amount_iva: @case_request.osm_reference_amount_iva, osm_special_spare: @case_request.osm_special_spare, osm_stock: @case_request.osm_stock, osmru_t_lcl: @case_request.osmru_t_lcl, registration_number: @case_request.registration_number, replacement_device: @case_request.replacement_device, request_id: @case_request.request_id, requested_end_date_time: @case_request.requested_end_date_time, requested_start_date_time: @case_request.requested_start_date_time, resource_group: @case_request.resource_group, resource_personal_number: @case_request.resource_personal_number, service_region: @case_request.service_region, source_id: @case_request.source_id, start_time: @case_request.start_time, status: @case_request.status, usage_qty: @case_request.usage_qty } }
    assert_redirected_to case_request_url(@case_request)
  end

  test "should destroy case_request" do
    assert_difference("CaseRequest.count", -1) do
      delete case_request_url(@case_request)
    end

    assert_redirected_to case_requests_url
  end
end
