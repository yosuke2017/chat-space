class Message < ApplicationRecord
  validates :body, presence: true, unless: "image.present?"
  belongs_to :group
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :group_id, presence: true
  validates :user_id, presence: true
end

