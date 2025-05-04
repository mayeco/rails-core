class SyncCarDetailsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Sync Car Models
    fetch_car_details("GetBrands").each do |resource|
      CarBrand.where(brand_id: resource["brandId"]).first_or_initialize.tap do |res|
        res.name = resource["name"]

        res.save! if res.changed?
      end
    end

    # Sync Car Classes
    fetch_car_details("GetClasses").each do |resource|
      CarClass.where(class_id: resource["classId"]).first_or_initialize.tap do |res|
        res.name = resource["name"]

        res.car_brand = CarBrand.find_by(brand_id: resource["brandId"]) if resource["brandId"].present?

        res.save! if res.changed?
      end
    end

    # Sync Car Models
    fetch_car_details("GetModels").each do |resource|
      CarModel.where(model_id: resource["classId"]).first_or_initialize.tap do |res|
        res.class_id = resource["classId"]
        res.brand_id = resource["brandId"]
        res.name = resource["name"]

        res.car_brand = CarBrand.find_by(brand_id: resource["brandId"]) if resource["brandId"].present?
        res.car_class = CarClass.find_by(class_id: resource["classId"]) if resource["classId"].present?

        res.save! if res.changed?
      end
    end
  end

  def fetch_car_details(detail)
    ExternalServices.external_data("api/Vehicles/#{detail}")
  end
end
