class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
