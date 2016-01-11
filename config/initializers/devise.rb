require "omniauth-google-oauth2"
Devise.setup do |config|
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

  require "devise/orm/active_record"

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..72

  config.reset_password_within = 6.hours

  require "devise/orm/active_record"

  config.sign_out_via = :get
  config.omniauth :facebook, ENV["FACEBOOK_KEY"], ENV["FACEBOOK_SECRET"],
    {scope: "email",
    client_options: {ssl: {ca_file: "/usr/lib/ssl/certs/ca-certificates.crt"}}}
  config.omniauth :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"], {}

end
