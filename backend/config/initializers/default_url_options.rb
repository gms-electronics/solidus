Rails.application.config.after_initialize do
  Rails.application.routes.default_url_options[:host] =
    Rails.env.production? ? "https://yourdomain.com" : "http://localhost:3000"
end
