class CarBrand < ApplicationRecord
  has_many :car_models
  has_many :car_classes
end
