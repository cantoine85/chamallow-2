class CreateJamSessionUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :jam_session_users do |t|
      t.references :user, foreign_key: true
      t.references :jam_session, foreign_key: true

      t.timestamps
    end
  end
end
