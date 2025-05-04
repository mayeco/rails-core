class Resource < ApplicationRecord
  has_prefix_id :resource

  belongs_to :resource_group
end
