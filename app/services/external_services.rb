# frozen_string_literal: true

class ExternalServices

  def self.fetch_access_token
    cache_key = "#{service_enabled}_#{tenant_id.gsub("-", "_")}_access_token"

    # Check if the access token is already cached
    cached_token = Rails.cache.read(cache_key)
    return cached_token if cached_token

    url = "https://login.microsoftonline.com/#{tenant_id}/oauth2/token"

    response = Faraday.post(url) do |req|
      req.body = {
        grant_type: "client_credentials",
        client_id: client_id,
        client_secret: client_secret,
        resource: resource
      }
    end

    parsed_response = parse_and_validate_response(response)

    access_token = parsed_response["access_token"]
    expires_in = parsed_response["expires_in"]

    # Cache the token with an expiration time
    Rails.cache.write(cache_key, access_token, expires_in: expires_in.to_i - 55) # Subtract 60 seconds for buffer

    access_token
  end

  def self.external_data(path, method: :get, params: {}, body: nil, cache: 10)
    cache_key = "#{service_enabled}_#{path.gsub("/", "_")}_data"

    # Check if the access token is already cached
    if method == :get && cache.present?
      cached_data = Rails.cache.read(cache_key)
      return cached_data if cached_data
    end

    access_token = fetch_access_token

    url = "#{service_url}/#{path}" # Base URL should be in environment variables

    response = Faraday.send(method, url) do |req|
      req.headers["Authorization"] = "Bearer #{access_token}"
      req.headers["Content-Type"] = "application/json"

      req.params = params if params.present?
      req.body = body.to_json if body.present? && %i[post put patch].include?(method)
    end

    data = parse_and_validate_response(response)

    Rails.cache.write(cache_key, data, expires_in: cache) if method == :get && cache.present?

    data
  end

  private

  def self.parse_and_validate_response(response)
    if response.success?
      begin
        JSON.parse(response.body)
      rescue JSON::ParserError
        raise "Invalid JSON response: #{response.body}"
      end
    else
      error_message = "Request failed: #{response.status} - #{response.reason_phrase}"
      error_message += "\nResponse body: #{response.body}" if response.body.present?
      raise error_message
    end
  end

  def self.service_enabled
    Figaro.env.SERVICE_ENABLE!
  end

  def self.tenant_id
    Figaro.env.AZURE_TENANT_ID!
  end

  def self.client_id
    if service_enabled == "api_core"
      Figaro.env.API_CORE_CLIENT_ID!
    else
      Figaro.env.DFO_CLIENT_ID!
    end
  end

  def self.client_secret
    if service_enabled == "api_core"
      Figaro.env.API_CORE_CLIENT_SECRET!
    else
      Figaro.env.DFO_CLIENT_SECRET!
    end
  end

  def self.resource
    if service_enabled == "api_core"
      Figaro.env.API_CORE_CLIENT_ID!
    else
      Figaro.env.DFO_URL!
    end
  end

  def self.service_url
    if service_enabled == "api_core"
      Figaro.env.API_CORE_URL!
    else
      Figaro.env.DFO_URL!
    end
  end
end
