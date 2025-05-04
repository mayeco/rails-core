class CreateCaseRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :case_requests do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :brand_id
      t.string :class_id
      t.string :contact_person_email
      t.string :contact_person_name
      t.string :contact_person_phone
      t.text :description
      t.integer :hours_estimated
      t.string :location
      t.string :model_id
      t.integer :model_year
      t.string :name
      t.datetime :osm_arrival_date
      t.datetime :osm_arrival_time
      t.string :osm_campaign
      t.string :osm_campaign_code
      t.string :osm_color
      t.string :osm_engine_number
      t.string :osm_external_ref_id
      t.string :osm_name_arrival
      t.string :osm_name_order
      t.datetime :osm_order_date
      t.datetime :osm_order_time
      t.string :osmru_t_lcl
      t.decimal :osm_reference_amount_iva
      t.string :osm_special_spare
      t.string :osm_stock
      t.string :registration_number
      t.string :replacement_device
      t.string :request_id
      t.string :resource_group
      t.string :resource_personal_number
      t.integer :service_region
      t.string :source_id
      t.string :status
      t.decimal :usage_qty

      t.timestamps
    end
  end
end
