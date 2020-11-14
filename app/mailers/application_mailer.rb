class ApplicationMailer < ActionMailer::Base
  default to: "info@mymovies.com", from: "info@mymovies.com"
  layout 'mailer'
end
