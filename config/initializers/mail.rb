ActionMailer::Base.smtp_settings = {
  # domain: 'YOUR_DOMAIN.COM',
  address:        "smtp-relay.sendinblue.com",
  port:            587,
  authentication: :plain,
  user_name:      ENV['SENDINBLUE_USER_NAME'],
  password:       ENV['SENDINBLUE_PASSWORD']
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"
