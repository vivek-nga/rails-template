class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.integer :chat_to
      t.integer :chat_from
      t.string :key
      t.boolean :deleted

      t.timestamps
    end
  end
end
