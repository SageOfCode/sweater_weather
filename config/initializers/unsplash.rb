Unsplash.configure do |config|
  config.application_access_key = ENV['image_api_key']
  config.application_secret = ENV['image_api_secret']
  config.application_redirect_uri = "https://your-application.com/oauth/callback"
  config.utm_source = "alices_terrific_client_app"
end