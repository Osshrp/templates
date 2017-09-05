class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :edit]
  def index
    @messages = Message.all
  end

  def show
    respond_with(@message)
  end

  def new
    respond_with(@message = Message.new)
  end

  def create
    respond_with(@message = Message.create(message_params))
  end

  def edit
    respond_with(@message)
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :text)
  end
end
