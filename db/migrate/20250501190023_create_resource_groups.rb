class CreateResourceGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :resource_groups do |t|
      t.string :dataAreaId
      t.string :groupId
      t.string :inputWarehouseId
      t.string :groupName

      t.timestamps
    end

    add_index :resource_groups, :groupId, unique: true
  end
end
