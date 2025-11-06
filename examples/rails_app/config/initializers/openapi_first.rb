require 'openapi_first'
OpenapiFirst.configure do |config|
  config.register Rails.root.join('../../spec/data/train-travel-api/openapi.yaml')
  config.register Rails.root.join('../../spec/data/attachments_openapi.yaml'), as: :attachments
  config.register Rails.root.join('../../spec/data/weather_openapi.yaml'), as: :weather
end
