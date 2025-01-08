# frozen_string_literal: true

require_relative "vipps_integration/version"

module VippsIntegration
  class Configuration
    attr_accessor :client_id, :client_secret, :merchant_id, :base_url

    def initialize
      @client_id = nil
      @client_secret = nil
      @merchant_id = nil
      @base_url = "https://api.vipps.no" # Standard base URL for Vipps
    end
  end

  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end
