Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"],ENV["GOOGLE_CLIENT_SECRET"], skip_jwt: true

    # unsure about this but it came recommended:
    
    # heroku config:add PLUGIN_HEROKU_CLIENT_ID=<CLIENT_ID_FROM_HEROKU> PLUGIN_HEROKU_CLIENT_SECRET=<CLIENT_SECRET_FROM_HEROKU>
end