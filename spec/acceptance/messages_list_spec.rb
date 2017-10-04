require 'rails_helper'

feature 'Messages list', %q{
  In order to find the required message,
  the user should have the opportunity
  to view the list of messages
} do
  given!(:messages) { create_list(:message, 2) }

  scenario 'user views list of messages' do
    visit messages_path

    expect(page).to have_content messages.first.title
    expect(page).to have_content messages.last.title
  end
end
