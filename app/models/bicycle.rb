class Bicycle < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader

  validates :description, length: {minimum: 20}, presence: true
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :user_id, presence: true
end
