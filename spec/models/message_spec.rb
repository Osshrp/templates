require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :text }

  describe '#parse' do
    let(:message) { create(:message, text: 'Hi {{name}} your balance: {{balance}} {{currency}}') }
    let(:account) { create(:account) }

    it 'replaces {{variable}} with its value in massage.text' do
      expect(message.parse(account)).to eq 'Hi TestName your balance: 1.5 rub'
    end
  end
end
