# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# Este archivo contiene todos los datos de inicialización para la base de datos.
# Se puede ejecutar con bin/rails db:seed (o con bin/rails db:setup que también ejecuta db:seed)

require 'factory_bot_rails'

# Limpia los datos existentes para evitar duplicados
puts "Limpiando datos existentes..."
CaseRequest.destroy_all
CarModel.destroy_all
CarClass.destroy_all
CarBrand.destroy_all
puts "Datos existentes eliminados."

# Crear marcas de coches
puts "Creando marcas de coches..."
brands = [
  FactoryBot.create(:car_brand, brand_id: "TOYT", name: "Toyota"),
  FactoryBot.create(:car_brand, brand_id: "HOND", name: "Honda"),
  FactoryBot.create(:car_brand, brand_id: "FORD", name: "Ford"),
  FactoryBot.create(:car_brand, brand_id: "BMW", name: "BMW"),
  FactoryBot.create(:car_brand, brand_id: "MERC", name: "Mercedes-Benz")
]
puts "#{brands.count} marcas de coches creadas."

# Crear clases de coches para cada marca
puts "Creando clases de coches..."
classes = []
brands.each do |brand|
  # Crear 2-3 clases por marca
  class_count = rand(2..3)

  case brand.name
  when "Toyota"
    classes << FactoryBot.create(:car_class, class_id: "SEDAN_T", name: "Sedán", car_brand: brand, brand_id: brand.brand_id)
    classes << FactoryBot.create(:car_class, class_id: "SUV_T", name: "SUV", car_brand: brand, brand_id: brand.brand_id)
    classes << FactoryBot.create(:car_class, class_id: "TRUCK_T", name: "Camioneta", car_brand: brand, brand_id: brand.brand_id) if class_count > 2
  when "Honda"
    classes << FactoryBot.create(:car_class, class_id: "SEDAN_H", name: "Sedán", car_brand: brand, brand_id: brand.brand_id)
    classes << FactoryBot.create(:car_class, class_id: "SUV_H", name: "SUV", car_brand: brand, brand_id: brand.brand_id)
  when "Ford"
    classes << FactoryBot.create(:car_class, class_id: "TRUCK_F", name: "Camioneta", car_brand: brand, brand_id: brand.brand_id)
    classes << FactoryBot.create(:car_class, class_id: "SUV_F", name: "SUV", car_brand: brand, brand_id: brand.brand_id)
    classes << FactoryBot.create(:car_class, class_id: "SEDAN_F", name: "Sedán", car_brand: brand, brand_id: brand.brand_id) if class_count > 2
  when "BMW"
    classes << FactoryBot.create(:car_class, class_id: "SEDAN_B", name: "Sedán", car_brand: brand, brand_id: brand.brand_id)
    classes << FactoryBot.create(:car_class, class_id: "COUPE_B", name: "Coupé", car_brand: brand, brand_id: brand.brand_id)
  when "Mercedes-Benz"
    classes << FactoryBot.create(:car_class, class_id: "SEDAN_M", name: "Sedán", car_brand: brand, brand_id: brand.brand_id)
    classes << FactoryBot.create(:car_class, class_id: "SUV_M", name: "SUV", car_brand: brand, brand_id: brand.brand_id)
    classes << FactoryBot.create(:car_class, class_id: "COUPE_M", name: "Coupé", car_brand: brand, brand_id: brand.brand_id) if class_count > 2
  end
end
puts "#{classes.count} clases de coches creadas."

# Crear modelos para cada clase
puts "Creando modelos de coches..."
models = []
classes.each do |car_class|
  # Crear 2-4 modelos por clase
  model_count = rand(2..4)

  brand = car_class.car_brand

  case [brand.name, car_class.name]
  when %w[Toyota Sedán]
      models << FactoryBot.create(:car_model, model_id: "CAMRY", name: "Camry", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      models << FactoryBot.create(:car_model, model_id: "COROLLA", name: "Corolla", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
  when %w[Toyota SUV]
      models << FactoryBot.create(:car_model, model_id: "RAV4", name: "RAV4", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      models << FactoryBot.create(:car_model, model_id: "HIGHLANDER", name: "Highlander", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
  when %w[Toyota Camioneta]
      models << FactoryBot.create(:car_model, model_id: "TACOMA", name: "Tacoma", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      models << FactoryBot.create(:car_model, model_id: "TUNDRA", name: "Tundra", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
  when %w[Honda Sedán]
      models << FactoryBot.create(:car_model, model_id: "CIVIC", name: "Civic", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      models << FactoryBot.create(:car_model, model_id: "ACCORD", name: "Accord", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
  when %w[Honda SUV]
      models << FactoryBot.create(:car_model, model_id: "CRV", name: "CR-V", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      models << FactoryBot.create(:car_model, model_id: "PILOT", name: "Pilot", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
  when %w[Ford Camioneta]
      models << FactoryBot.create(:car_model, model_id: "F150", name: "F-150", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      models << FactoryBot.create(:car_model, model_id: "RANGER", name: "Ranger", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
  when %w[Ford SUV]
      models << FactoryBot.create(:car_model, model_id: "EXPLORER", name: "Explorer", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      models << FactoryBot.create(:car_model, model_id: "ESCAPE", name: "Escape", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
  when %w[Ford Sedán]
      models << FactoryBot.create(:car_model, model_id: "FUSION", name: "Fusion", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      models << FactoryBot.create(:car_model, model_id: "FOCUS", name: "Focus", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
  when %w[BMW Sedán]
      models << FactoryBot.create(:car_model, model_id: "320I", name: "Serie 3", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      models << FactoryBot.create(:car_model, model_id: "520I", name: "Serie 5", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
  when %w[BMW Coupé]
      models << FactoryBot.create(:car_model, model_id: "M4", name: "M4", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      models << FactoryBot.create(:car_model, model_id: "Z4", name: "Z4", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
  when %w[Mercedes-Benz Sedán]
      models << FactoryBot.create(:car_model, model_id: "CCLASS", name: "Clase C", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      models << FactoryBot.create(:car_model, model_id: "ECLASS", name: "Clase E", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
  when %w[Mercedes-Benz SUV]
      models << FactoryBot.create(:car_model, model_id: "GLC", name: "GLC", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      models << FactoryBot.create(:car_model, model_id: "GLE", name: "GLE", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
  when %w[Mercedes-Benz Coupé]
      models << FactoryBot.create(:car_model, model_id: "AMG_GT", name: "AMG GT", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      models << FactoryBot.create(:car_model, model_id: "CLS", name: "CLS", car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
    else
      # Caso por defecto
      model_count.times do |i|
        models << FactoryBot.create(:car_model, car_brand: brand, car_class: car_class, brand_id: brand.brand_id, class_id: car_class.class_id)
      end
  end
end
puts "#{models.count} modelos de coches creados."

# Crear solicitudes de servicio (case requests)
puts "Creando solicitudes de servicio..."
case_requests = []

# Crear solicitudes para la próxima semana
(0..6).each do |day_offset|
  date = Date.today + day_offset.days

  # Solo crear para días laborables (lunes a viernes)
  next if date.saturday? || date.sunday?

  # Crear 2-5 solicitudes por día
  request_count = rand(2..5)

  request_count.times do |i|
    # Seleccionar un modelo aleatorio
    model = models.sample

    # Hora de inicio (entre 9 AM y 3 PM)
    start_hour = rand(9..15)
    start_time = date.to_time.change(hour: start_hour, min: 0, sec: 0)

    # Duración entre 1 a 3 horas
    duration_hours = rand(1..3)
    end_time = start_time + duration_hours.hours

    case_requests << FactoryBot.create(
      :case_request,
      start_time: start_time,
      end_time: end_time,
      brand_id: model.car_brand.brand_id,
      class_id: model.car_class.class_id,
      model_id: model.model_id,
      model_year: rand(2020..2025),
      name: "Servicio #{model.car_brand.name} #{model.name}",
      registration_number: "ABC#{rand(1000..9999)}"
    )
  end
end
puts "#{case_requests.count} solicitudes de servicio creadas."

puts "¡Sembrado completo!"
