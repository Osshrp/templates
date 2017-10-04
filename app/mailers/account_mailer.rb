class AccountMailer < ApplicationMailer
  def notify(message, account)
    @title = message.title
    @text = message.parse(account)
    mail(to: account.email, subject: "Message to #{account.name}")
  end
end
