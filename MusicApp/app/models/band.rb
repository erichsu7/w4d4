class Band < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :albums, dependent: :destroy, inverse_of: :band

  has_many :tracks, through: :albums, source: :tracks
end
