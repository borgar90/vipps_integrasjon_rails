require 'faraday'
require 'json'

module VippsIntegration
  class Client
    def initialize
      @base_url = VippsIntegration.configuration.base_url
      @client_id = VippsIntegration.configuration.client_id
      @client_secret = VippsIntegration.configuration.client_secret
      @merchant_id = VippsIntegration.configuration.merchant_id
    end

    def request_token
      response = Faraday.post("#{@base_url}/accessToken/get") do |req|
        req.headers['Authorization'] = "Basic #{Base64.strict_encode64("#{@client_id}:#{@client_secret}")}"
        req.headers['Content-Type'] = 'application/json'
      end
      JSON.parse(response.body)
    end

    def create_payment(order_id:, amount:, callback_url:)
      token = request_token['access_token']
      payload = {
        merchantInfo: {
          merchantSerialNumber: @merchant_id,
          callbackPrefix: callback_url
        },
        transaction: {
          orderId: order_id,
          amount: amount,
          transactionText: "Payment for order #{order_id}"
        }
      }

      response = Faraday.post("#{@base_url}/ecomm/v2/payments") do |req|
        req.headers['Authorization'] = "Bearer #{token}"
        req.headers['Content-Type'] = 'application/json'
        req.body = payload.to_json
      end
      JSON.parse(response.body)
    end
  end
end