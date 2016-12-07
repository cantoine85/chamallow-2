class JamSessionUser < ApplicationRecord
  belongs_to :user
  belongs_to :jam_session
end
