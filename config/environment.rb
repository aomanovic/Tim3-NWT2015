# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
HealthMonitor::Application.initialize!

ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.gmail.com',
    :port           => '587',
    :authentication => :plain,
    :user_name      => 'healthmonitoretf@gmail.com',
    :password       => 'nwt123456',
    :domain         => 'gmail.com',
    :enable_starttls_auto => true
}