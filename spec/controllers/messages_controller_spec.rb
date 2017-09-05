require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:question) { create(:question) }
  describe 'GET #index' do
    let(:messages) { create_list(:message, 2) }

    before { get :index }
    it 'populates an array of all messages' do
      expect(assigns(:messages)).to match_array(messages)
    end
    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
