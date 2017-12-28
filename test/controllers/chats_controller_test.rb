require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat = chats(:one)
  end

  test "should get index" do
    get chats_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_url
    assert_response :success
  end

  test "should create chat" do
    assert_difference('Chat.count') do
      post chats_url, params: { chat: { chat_from: @chat.chat_from, chat_to: @chat.chat_to, msg: @chat.msg, msg_type: @chat.msg_type } }
    end

    assert_redirected_to chat_url(Chat.last)
  end

  test "should show chat" do
    get chat_url(@chat)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_url(@chat)
    assert_response :success
  end

  test "should update chat" do
    patch chat_url(@chat), params: { chat: { chat_from: @chat.chat_from, chat_to: @chat.chat_to, msg: @chat.msg, msg_type: @chat.msg_type } }
    assert_redirected_to chat_url(@chat)
  end

  test "should destroy chat" do
    assert_difference('Chat.count', -1) do
      delete chat_url(@chat)
    end

    assert_redirected_to chats_url
  end
end
