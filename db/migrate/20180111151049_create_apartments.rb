class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.string :upload
      t.string :name

      t.timestamps
    end
  end
end
