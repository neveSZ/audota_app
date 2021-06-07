# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: 'apikey',
  password: ENV['sendgrid_password'],
  domain: 'localhost',
  address: 'smtp.sendgrid.net',
  port: 465,
  authentication: :plain,
  enable_starttls_auto: true
}
