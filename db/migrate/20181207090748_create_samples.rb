class CreateSamples < ActiveRecord::Migration[5.2]
  def change
    create_table :samples do |t|
      t.string :title
      t.string :description
      t.references :user, foreign_key: true
      t.references :exhibition, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
