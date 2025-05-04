class CreateCarModels < ActiveRecord::Migration[8.0]
  def change
    create_table :car_models do |t|
      t.string :brand_id
      t.string :class_id
      t.string :model_id
      t.string :name
      t.string :opr_model_id

      t.references :car_class, index: false, foreign_key: true
      t.references :car_brand, index: false, foreign_key: true

      t.timestamps
    end
  end
end
