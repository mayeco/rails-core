class CarClass < ApplicationRecord
  belongs_to :car_brand, optional: true
  has_many :car_models
end
