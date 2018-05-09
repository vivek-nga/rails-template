class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.where.not(id: current_user.id).limit(10)
  end

  def show
    @chats = @conversation.chats
  end

  private
  def set_conversation
    @conversation = Conversation.find_or_create_by(key: params[:key]) if params[:key]
  end
end