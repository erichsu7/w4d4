class Track < ActiveRecord::Base
  TRACK_TYPE_OPTIONS = %w(regular bonus)

  validates :title, presence: true

  belongs_to :album, inverse_of: :tracks

  has_one :band, through: :album, source: :band

  has_many :notes
end
