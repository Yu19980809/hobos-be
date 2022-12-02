class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :description
      t.string :poster_url
      t.string :address
      t.string :club_name
      t.string :date
      t.string :time
      t.string :comedian_name
      t.string :organizer_name

      t.timestamps
    end
  end
end
