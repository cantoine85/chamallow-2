class ChangeLocationTypeFromTextToString < ActiveRecord::Migration[5.0]
  def change
    change_column :jam_sessions, :location, :string
  end
end
