class CreateCarClasses < ActiveRecord::Migration[8.0]
  def change
    create_table :car_classes do |t|
      t.string :brand_id
      t.string :class_id
      t.string :name

      t.references :car_brand, index: true, foreign_key: true

      t.timestamps
    end
  end
end
