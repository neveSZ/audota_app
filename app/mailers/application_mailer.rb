# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['gmail_email']
  layout 'mailer'
end
