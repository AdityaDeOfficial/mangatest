class CreateMangas < ActiveRecord::Migration[7.0]
  def change
    create_table :mangas do |t|
      t.string :manga_title
      t.string :author
      t.string :description
      t.string :genre_tag
      t.references :user, null: false, foreign_key: true
      t.json :cover_image

      t.timestamps
    end
  end
end
