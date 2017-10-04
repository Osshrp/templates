require 'rails_helper'

feature 'Author deletes message' do

  given(:message) { create(:message) }

  scenario 'Author tries to delete his message' do

    visit message_path(message)
    click_on 'Delete message'

    expect(page).to have_content 'Message was successfully destroyed'
    expect(page).to have_no_content message.title
  end
end
