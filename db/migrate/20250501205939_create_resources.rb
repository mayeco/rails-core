class CreateResources < ActiveRecord::Migration[8.0]
  def change
    create_table :resources do |t|
      t.string :dataAreaId
      t.string :resourceId
      t.string :resourceWorkerPersonnelNumber
      t.string :resourceName
      t.string :resourceGroup

      t.references :resource_group, foreign_key: true, index: true

      t.timestamps
    end

    add_index :resources, :resourceId, unique: true
  end
end
