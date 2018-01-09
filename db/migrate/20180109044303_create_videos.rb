class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :name
      t.text :description
      t.string :video_url
      t.string :thumbnail

      t.integer :status, default: 0
      t.integer :provider_type, default: 0
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
