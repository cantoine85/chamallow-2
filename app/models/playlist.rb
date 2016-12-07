class Playlist < ApplicationRecord
  belongs_to :jam_session
  belongs_to :song
end
