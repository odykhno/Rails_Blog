Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, SocialNetworkSettings.facebook.key, SocialNetworkSettings.facebook.secret
end