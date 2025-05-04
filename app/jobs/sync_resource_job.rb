class SyncResourceJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ExternalServices.external_data("api/Resources/GetResources").each do |resource|
      Resource.where(resourceId: resource["resourceId"]).first_or_initialize.tap do |res|
        res.dataAreaId = resource["dataAreaId"]
        res.resourceId = resource["resourceId"]
        res.resourceWorkerPersonnelNumber = resource["resourceWorkerPersonnelNumber"]
        res.resourceName = resource["resourceName"]
        res.resourceGroup = resource["resourceGroup"]

        res.resource_group = ResourceGroup.find_by(groupId: resource["resourceGroup"]) if resource["resourceGroup"].present?

        res.save! if res.changed?
      end
    end
  end
end
