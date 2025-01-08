require 'rails/generators'

module VippsIntegration
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def create_initializer_file
        template "vipps_initializer.rb", "config/initializers/vipps.rb"
      end
    end
  end
end
