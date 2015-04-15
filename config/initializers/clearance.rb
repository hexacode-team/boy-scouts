Clearance.configure do |config|
    
      # Specify some defaults for the user authentication.
      config.user_model = User
      config.cookie_domain = '.boyscoutsflagroutes.com'
      config.cookie_name = 'authentication_token'
    
      # TODO: Use proper email.
    config.mailer_sender = "reply@example.com"
end