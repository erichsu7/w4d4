class Album < ActiveRecord::Base
  GENRE_OPTIONS = %w(pop rock hip-hop/rap r&b electronic country classical alternative).sort
  ALBUM_TYPE_OPTIONS = %w(studio live)

  validates :name, presence: true
  validates :genre, inclusion: { in: GENRE_OPTIONS }
  validates :album_type, presence: true, inclusion: { in: ALBUM_TYPE_OPTIONS }

  has_many :tracks, dependent: :destroy

  belongs_to :band, inverse_of: :albums
end
