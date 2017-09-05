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

  describe 'GET #new' do
    before { get :new }
    it 'assigns a new Message to @message' do
      expect(assigns(:message)).to be_a_new(Message)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do

      it 'creates message' do
        expect { post :create, params: { message: attributes_for(:message) } }
          .to change(Message, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { message: attributes_for(:message) }
        expect(response).to redirect_to message_path(assigns(:message))
      end
    end

    context 'with invalid attributes' do
      it 'does not save the message' do
        expect { post :create, params: { message: attributes_for(:invalid_message) } }
          .to_not change(Message, :count)
      end

      it 're-renders new view' do
        post :create, params: { message: attributes_for(:invalid_message) }
        expect(response).to render_template :new
      end
    end
  end
end
