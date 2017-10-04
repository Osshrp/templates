require "rails_helper"

RSpec.describe AccountMailer, type: :mailer do
  describe "notify" do
    let(:account)  { create(:account) }
    let(:message) { create(:message, text: 'Hi {{name}} your balance: {{balance}} {{currency}}') }
    let(:mail) { AccountMailer.notify(message, account) }

    it "renders the headers" do
      expect(mail.subject).to eq("Message to #{account.name}")
      expect(mail.to).to eq([account.email])
      expect(mail.from).to eq(['from@example.com'])
    end

    it "renders the body" do
      expect(mail.body.encoded).to have_content(message.title)
      expect(mail.body.encoded).to have_content('Hi TestName your balance: 1.5 rub')
    end
  end
end
