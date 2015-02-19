class Artist < ActiveRecord::Base
  has_many :songs, dependent: :destroy
end

class Song < ActiveRecord::Base
  belongs_to :artist
end