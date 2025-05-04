class ResourceGroup < ApplicationRecord
  has_prefix_id :resources_group

  has_many :resources
end
