class Note < ActiveRecord::Base
  validates :user_id, :track_id, :body, presence: true

  belongs_to :author,
    class_name: 'User',
    foreign_key: :user_id

  belongs_to :track

end
