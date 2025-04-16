require "redis"

redis_config = {
  url: Figaro.env.REDIS_URL || "redis://localhost:6379/0",
  ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE },
  connect_timeout: 5,
  reconnect_attempts: 3
}

$redis = Redis.new(redis_config)
