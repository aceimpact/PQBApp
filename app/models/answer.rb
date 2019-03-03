class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :answer_image_relationships, dependent: :destroy
  has_many :answer_images, through: :answer_image_relationships
  accepts_nested_attributes_for :answer_images, allow_destroy: true, reject_if: :all_blank
  has_many :answer_likes, dependent: :destroy

  validates :content, presence: true

  def answer_like_user(user_id)
    answer_likes.find_by(user_id: user_id)
  end
end
