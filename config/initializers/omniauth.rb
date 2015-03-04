Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'XMq02hApAWPAOnDklD5WS5iJW', 'fNJLgpbhQ692N5MlKkyC5VL6UhASrFzRdBEMiAZfdIIZm2fejb'
  provider :facebook, '1059441944075040', 'c8f531034ed1c75ade04681b69c0ff83'
  provider :linkedin, '759z81vgz1030w', 'wZgYqW038UrOjwVf'
end
