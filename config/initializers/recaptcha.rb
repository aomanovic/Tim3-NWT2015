Recaptcha.configure do |config|
  config.public_key  = ENV['RECAPTCHA_PUBLIC_KEY']
  config.private_key = ENV['RECAPTCHA_PRIVATE_KEY']
  config.api_version = 'v1'

  #monkey patch to fix html_safe method
  class String
    def html_safe
      self
    end
  end

  # get an api key (free) from http://www.google.com/recaptcha
  ENV['RECAPTCHA_PUBLIC_KEY'] = '6Lc-ZggTAAAAABT63pzCFfpKP397cQ0J5ecf6lPL'
  ENV['RECAPTCHA_PRIVATE_KEY'] = '6Lc-ZggTAAAAAI9ERNUdEZUiZ8UVSOEfJvP17VB1'
end