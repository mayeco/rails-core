class SyncResourceGroupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    fetch_resource_groups.each do |resource_group|
      ResourceGroup.where(groupId: resource_group["groupId"]).first_or_initialize.tap do |group|
        group.dataAreaId = resource_group["dataAreaId"]
        group.groupId = resource_group["groupId"]
        group.inputWarehouseId = resource_group["inputWarehouseId"]
        group.groupName = resource_group["groupName"]

        group.save! if group.changed?
      end
    end
  end

  def fetch_resource_groups
    ExternalServices.external_data("api/Resources/GetResourceGroups")
  end
end
