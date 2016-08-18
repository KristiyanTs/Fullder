# frozen_string_literal: true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: '587',
  authentication: :plain,
  user_name: 'omnimenu2016@gmail.com',
  password: 'kris2016',
  domain: 'omnimenu.org',
  enable_starttls_auto: true
}
