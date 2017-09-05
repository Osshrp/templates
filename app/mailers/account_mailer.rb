class AccountMailer < ApplicationMailer
  def notify(message, account)
    @title = message.title
    @text = message.parse(account)
  end
end
