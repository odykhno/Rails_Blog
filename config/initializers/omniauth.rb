Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, SocialNetworkSettings.facebook.key, SocialNetworkSettings.facebook.secret
  provider :vkontakte, SocialNetworkSettings.vkontakte.key, SocialNetworkSettings.vkontakte.secret
end