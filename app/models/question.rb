class Question < ApplicationRecord
  belongs_to :user

  validates :subject, presence: true
  validates :content, presence: true

  enum subject:{japanese: 0, math: 1, society: 2, science: 3, english: 4}
end