require 'rails_helper'

feature 'User edit message' do

  given(:message) { create(:message) }

  scenario 'User edits message' do
    visit message_path(message)
    click_on 'Edit message'
    fill_in 'Title', with: 'edited message title'
    fill_in 'Text', with: 'edited message text'
    click_on 'Save message'

    expect(page).to_not have_content message.title
    expect(page).to_not have_content message.text
    expect(page).to have_content 'edited message title'
    expect(page).to have_content 'edited message text'
  end
end
