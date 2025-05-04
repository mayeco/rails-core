class HerokuMaintenanceJob < ApplicationJob
  queue_as :default

  def perform(*args)

    # Check if the app is already in maintenance mode
    if HerokuMaintenanceService.new.enable_maintenance_mode
      Rails.logger.info "Heroku maintenance mode enabled successfully."
    else
      Rails.logger.error "Failed to enable Heroku maintenance mode."
    end

  end
end
