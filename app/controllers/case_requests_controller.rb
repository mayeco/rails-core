class CaseRequestsController < ApplicationController
  before_action :set_case_request, only: %i[ edit update location_info calendar_availability client_info date_availability finalize ]
  before_action :load_car_data, only: %i[ new edit location_info calendar_availability client_info ]

  # GET /case_requests/new
  def new
    @case_request = CaseRequest.new
  end

  # GET /case_requests/1/edit
  def edit
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  # POST /case_requests or /case_requests.json
  def create
    @case_request = CaseRequest.new(case_request_params)
    load_car_data

    respond_to do |format|
      if @case_request.save
        format.turbo_stream { redirect_to location_info_case_request_path(@case_request) }
      else
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  def location_info
  end

  def client_info
  end

  def calendar_availability
  end

  # PATCH/PUT /case_requests/1 or /case_requests/1.json
  def update
    @case_request.assign_attributes(case_request_params)
    load_car_data

    respond_to do |format|
      if @case_request.save
        if case_request_params[:form_identifier] == "case_request_form_1"
          format.turbo_stream { redirect_to location_info_case_request_path(@case_request) }
        elsif case_request_params[:form_identifier] == "case_request_form_2"
          format.turbo_stream { redirect_to client_info_case_request_path(@case_request) }
        elsif case_request_params[:form_identifier] == "case_request_form_3"
          format.turbo_stream { redirect_to calendar_availability_case_request_path(@case_request) }
        end
      else
        if case_request_params[:form_identifier] == "case_request_form_1"
          format.turbo_stream { render :edit, status: :unprocessable_entity }
        elsif case_request_params[:form_identifier] == "case_request_form_2"
          format.turbo_stream { render :location_info, status: :unprocessable_entity }
        elsif case_request_params[:form_identifier] == "case_request_form_3"
          format.turbo_stream { render :client_info, status: :unprocessable_entity }
        end
      end
    end
  end

  def finalize
  end

  def date_availability
    @case_request.form_identifier = "case_request_form_4"
    @date = Date.parse(date_params.to_s)

    start_of_day = @date.beginning_of_day.in_time_zone
    end_of_day = @date.end_of_day.in_time_zone

    @case_requests = CaseRequest.where("start_time < ? AND end_time > ?", end_of_day, start_of_day).to_a

    start_hour = 9
    end_hour = 17

    potential_slots = (start_hour..end_hour).map do |hour_number|
      start_of_day.change(hour: hour_number)
    end

    @available_slots = potential_slots.reject do |slot_start_time|
      slot_end_time = slot_start_time.advance(hours: 1)

      # Verificamos si *alguna* de las solicitudes existentes (@case_requests) se solapa con esta franja (`slot`)
      @case_requests.any? do |request|
        request.start_time < slot_end_time && request.end_time > slot_start_time
      end
    end

    respond_to do |format|
      format.turbo_stream
    end
  end

  # GET /car_classes for the dependent select
  def car_classes
    brand_id = params[:brand_id]
    @car_classes = CarClass.where(brand_id: brand_id).order(:name)

    render json: @car_classes.map { |c| { id: c.class_id, name: c.name } }
  end

  # GET /car_models for the dependent select
  def car_models
    brand_id = params[:brand_id]
    class_id = params[:class_id]
    @car_models = CarModel.where(brand_id: brand_id, class_id: class_id).order(:name)

    render json: @car_models.map { |m| { id: m.model_id, name: m.name } }
  end

  private

  # Load car related data for the form
  def load_car_data
    @car_brands = CarBrand.all.order(:name)

    if @case_request&.brand_id.present?
      @car_classes = CarClass.where(brand_id: @case_request.brand_id).order(:name)
    else
      @car_classes = []
    end

    if @case_request&.brand_id.present? && @case_request&.class_id.present?
      @car_models = CarModel.where(
        brand_id: @case_request.brand_id,
        class_id: @case_request.class_id
      ).order(:name)
    else
      @car_models = []
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_case_request
    @case_request = CaseRequest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def case_request_params
    params.require(:case_request).permit(
      :brand_id, :class_id, :model_id, :model_year,
      :registration_number, :usage_qty, :form_identifier,
      :service_region, :location, :contact_person_email,
      :contact_person_name, :contact_person_phone, :description
    )
  end

  def date_params
    params.require(:date)
  end
end
