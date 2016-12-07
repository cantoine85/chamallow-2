class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.references :jam_session, foreign_key: true
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
