class Image < ApplicationRecord
  has_many :question_images, dependent: :destroy
  has_many :questions, through: :question_images

  validates :file, presence: true

  mount_uploader :file, ImagesUploader
end
