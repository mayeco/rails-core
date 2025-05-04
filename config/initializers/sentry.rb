# frozen_string_literal: true

Sentry.init do |config|
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  config.dsn = Figaro.env.SENTRY_DSN!
  config.traces_sample_rate = 1.0
end
