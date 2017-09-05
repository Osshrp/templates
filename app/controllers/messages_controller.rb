class MessagesController < ApplicationController
  before_action :set_message, only: :show
  def index
    @messages = Message.all
  end

  def show
    respond_with @message
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end
end
