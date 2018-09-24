class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.sent.subject
  #
  def sent(contact)
    @contact = contact

    mail(to: @contact.email, from: ENV['SMTP_MAIL'], subject: "お問い合わせありがとうございます。")
  end

  def received(contact)
    @contact = contact

    mail(to: ENV['SMTP_MAIL'], from: ENV['SMTP_MAIL'], subject: "お問い合わせがありました。")
  end
  
end
