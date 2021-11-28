class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.text       :image_data
      t.references :treasure, foreign_key: true

      t.timestamps
    end
  end
end
