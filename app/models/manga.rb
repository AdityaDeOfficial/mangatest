class Manga < ApplicationRecord
  belongs_to :user
  has_many :chapters
  has_many :bookmarks, dependent: :destroy
  has_many :manga_reviews, dependent: :destroy
  validates :manga_title, presence: true
  validates :author, :description, :genre_tag, presence: true

  has_one_attached :cover_image
end
