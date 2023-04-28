class Chapter < ApplicationRecord
  belongs_to :manga
  has_many_attached :pdf_upload

  validates :chapter_title, presence: true
  validates :chapter_number, presence: true
  validates :pdf_upload, presence: true
end
