# frozen_string_literal: true

require_relative "vipps_integration/version"
require "i18n"

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

    def load_i18n
      # Legger til oversettelsesfiler i i18n sin lastesti
      I18n.load_path += Dir[File.expand_path("locales/*.yml", __dir__)]
      I18n.default_locale = :en # Setter standardspråk til engelsk
    end
  end

  # Laster i18n-konfigurasjonen automatisk når modulen lastes inn
  load_i18n
end