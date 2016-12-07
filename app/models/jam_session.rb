class JamSession < ApplicationRecord
  validates :title, presence: true
  has_many :playlists
  has_many :songs, through: :playlists
  has_many :jam_session_users
  has_many :users, through: :jam_session_users
end
