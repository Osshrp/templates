require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:message) { create(:message) }
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

  describe 'GET #show' do
    before { get :show, params: { id: message } }

    it 'assigns requested message to @message' do
      expect(assigns(:message)).to eq message
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end
