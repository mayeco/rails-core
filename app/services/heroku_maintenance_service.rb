# app/services/heroku_maintenance_service.rb
class HerokuMaintenanceService
  attr_reader :app_name, :api_token

  def initialize(app_name = nil, api_token = nil)
    @app_name = app_name || Figaro.env.HEROKU_APP_NAME!
    @api_token = api_token || Figaro.env.HEROKU_API_TOKEN!
  end

  def enable_maintenance_mode
    update_maintenance_mode(true)
  end

  def disable_maintenance_mode
    update_maintenance_mode(false)
  end

  private

  def update_maintenance_mode(maintenance_enabled)
    response = connection.patch do |req|
      req.url "/apps/#{app_name}"
      req.body = { maintenance: maintenance_enabled }.to_json
    end

    if response.success?
      Rails.logger.info "Maintenance mode #{maintenance_enabled ? 'enabled' : 'disabled'} for #{app_name}"
      true
    else
      Rails.logger.error "Failed to #{maintenance_enabled ? 'enable' : 'disable'} maintenance mode: #{response.body}"
      false
    end
  rescue Faraday::Error => e
    Rails.logger.error "Heroku API error: #{e.message}"
    false
  end

  def connection
    @connection ||= Faraday.new(url: "https://api.heroku.com") do |conn|
      conn.headers["Content-Type"] = "application/json"
      conn.headers["Accept"] = "application/vnd.heroku+json; version=3"
      conn.headers["Authorization"] = "Bearer #{api_token}"
      conn.adapter Faraday.default_adapter
    end
  end
end
