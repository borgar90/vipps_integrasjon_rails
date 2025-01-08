VippsIntegration.configure do |config|
  config.client_id = ENV['VIPPS_CLIENT_ID']
  config.client_secret = ENV['VIPPS_CLIENT_SECRET']
  config.merchant_id = ENV['VIPPS_MERCHANT_ID']
  config.base_url = "https://api.vipps.no"
end
