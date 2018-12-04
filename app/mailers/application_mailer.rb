class ApplicationMailer < ActionMailer::Base
  default from: ENV['MG_SENDER']
  layout 'mailer'
end
