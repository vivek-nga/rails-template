class AddFieldsToChats < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :conversation_id, :integer
    add_column :chats, :user_id, :integer
    remove_column :chats, :chat_to
    remove_column :chats, :chat_from
  end
end
