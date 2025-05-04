class CaseRequest < ApplicationRecord
  has_prefix_id :case_request

  attr_accessor :form_identifier

  validates :brand_id, :class_id, :model_id, :model_year,
            :registration_number, :usage_qty, presence: true
  validates :model_year, numericality: {
    greater_than_or_equal_to: 1970,
    message: "debe ser igual o posterior a 1970"
  }

  validate :validate_location_if_persisted

  def validate_location_if_persisted
    if persisted? && form_identifier == "case_request_form_2"
      errors.add(:service_region, "no puede estar en blanco") if service_region.blank?
      errors.add(:location, "no puede estar en blanco") if location.blank?
    end

    if persisted? && form_identifier == "case_request_form_3"
      errors.add(:contact_person_email, "no puede estar en blanco") if contact_person_email.blank?
      errors.add(:contact_person_name, "no puede estar en blanco") if contact_person_name.blank?
      errors.add(:contact_person_phone, "no puede estar en blanco") if contact_person_phone.blank?
      errors.add(:description, "no puede estar en blanco") if description.blank?
    end
  end

  def requested_start_date_time
    start_time
  end

  def requested_end_date_time
    end_time
  end

  def step_vehicle
    return false if form_identifier == "case_request_form_1" && invalid?

    persisted?
  end

  def step_location
    step_vehicle && service_region.present? && location.present?
  end

  def step_client
    step_location && contact_person_email.present? && contact_person_phone.present? &&
      contact_person_name.present? && description.present?
  end

  def step_calendar
    step_client && form_identifier == "case_request_form_4"
  end
end
