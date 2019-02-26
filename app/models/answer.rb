class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :answer_image_relationships, dependent: :destroy
  has_many :answer_images, through: :answer_image_relationships
  accepts_nested_attributes_for :answer_images, allow_destroy: true, reject_if: :all_blank

  validates :content, presence: true
end
