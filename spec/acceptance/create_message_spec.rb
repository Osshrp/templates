require 'rails_helper'

feature 'Create message' do
  scenario 'User creates message' do
    visit messages_path
    click_on 'New message'

    fill_in 'Title', with: 'Message title'
    fill_in 'Text', with: 'text text'
    click_on 'Create'

    expect(page).to have_content 'Message was successfully created'
    expect(page).to have_content 'Message title'
    expect(page).to have_content 'text text'
  end
end
