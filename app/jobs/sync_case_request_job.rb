class SyncCaseRequestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    fetch_case_requests.each do |case_request|
      CaseRequest.where(request_id: case_request["requestId"]).first_or_initialize.tap do |cr|
        cr.end_time = case_request["requestedEndDateTime"]
        cr.start_time = case_request["requestedStartDateTime"]

        cr.resource_group = case_request["resourceGroup"]
        cr.resource_personal_number = case_request["resourcePersonalNumber"]
        cr.source_id = case_request["sourceId"]
        cr.status = case_request["status"]
        cr.request_id = case_request["requestId"]

        cr.save! if cr.changed?
      end
    end
  end

  def fetch_case_requests
    # TODO: FIX this
    # from_date = Time.current.beginning_of_day.utc.iso8601
    from_date = Time.current.beginning_of_year.utc.iso8601
    to_date = 30.days.from_now.utc.iso8601

    params = { company: "CGCH",
               fromDate: from_date,
               toDate: to_date }

    ExternalServices.external_data("/api/ServiceSchedule/GetCaseRequestSchedule", params: params)
  end
end
