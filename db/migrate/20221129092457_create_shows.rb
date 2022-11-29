class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :description
      t.string :poster_url
      t.string :address
      t.time :time
      t.string :comedian
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
