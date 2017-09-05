require 'rails_helper'

feature 'View message', %q{
  In order to see message
  I need to be able to view message
} do
  given(:message) { create(:message) }

  context 'User' do
    scenario 'sees the message' do
      visit message_path(message)

      expect(page).to have_content 'MyString'
      expect(page).to have_content 'MyText'
    end
  end
end
