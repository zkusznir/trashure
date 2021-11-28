class CreateTreasures < ActiveRecord::Migration[6.1]
  def change
    create_table :treasures do |t|
      t.string  :name,      null: false
      t.string  :description
      t.decimal :latitude,  precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.string  :tags,      array: true, default: []
      t.integer :status,    null: false, default: 0

      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
