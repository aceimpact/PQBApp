# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => 587,
  :authentication => :plain,
  :user_name      => Settings.sendgrid[:user_name],
  :password       => Settings.sendgrid[:password],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}
