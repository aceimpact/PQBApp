class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :question_likes, dependent: :destroy
  has_many :answer_likes, dependent: :destroy

  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum grade: { firstgrade: 0, secondgrade: 1, thirdgrade: 2 }

  mount_uploader :icon, ImagesUploader

  def self.grades_names
    grades.keys.map {|grade_key| [I18n.t("enums.user.grade.#{grade_key}"), grade_key]}
  end
end
