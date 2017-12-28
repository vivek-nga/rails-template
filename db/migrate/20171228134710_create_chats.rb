class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.integer :chat_to
      t.integer :chat_from
      t.boolean :unread
      t.text :msg
      t.integer :msg_type

      t.timestamps
    end
  end
end
