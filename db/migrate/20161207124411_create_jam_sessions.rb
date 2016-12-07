class CreateJamSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :jam_sessions do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.text :location

      t.timestamps
    end
  end
end
