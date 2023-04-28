class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :manga

  validates :manga_id, uniqueness: { scope: :user_id }
end
