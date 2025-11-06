# frozen_string_literal: true

require "rails/railtie"

module OpenapiFirst
  class Railtie < ::Rails::Railtie
    config.openapi_first = ActiveSupport::OrderedOptions.new
    config.openapi_first.request_middleware_enabled = true
    config.openapi_first.response_middleware_enabled = true

    initializer "openapi_first_middleware.rack", after: :load_config_initializers do |app|
      if app.config.openapi_first.request_middleware_enabled
        app.config.middleware.insert(0, OpenapiFirst::Middlewares::RequestValidation)
      end
      if app.config.openapi_first.response_middleware_enabled
        app.config.middleware.insert(0, OpenapiFirst::Middlewares::ResponseValidation)
      end
    end
  end
end
