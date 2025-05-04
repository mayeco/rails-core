class CarModel < ApplicationRecord
  belongs_to :car_brand, optional: true
  belongs_to :car_class, optional: true
end
