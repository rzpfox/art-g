class CreatePaintings < ActiveRecord::Migration[5.2]
  def change
    create_table :paintings do |t|
      t.string :title
      t.string :description
      t.string :status
      t.string :value
      t.references :gallery, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
