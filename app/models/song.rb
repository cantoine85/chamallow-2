class Song < ApplicationRecord
  validates :author, :title, :lyrics, presence:true
end
