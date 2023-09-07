class Suggestion < ApplicationRecord

  belongs_to :bicycle
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :description, length: {minimum: 20}, presence: true
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def user_id
    bicycle.user_id
  end
  
end
