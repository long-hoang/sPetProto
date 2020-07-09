class Plan < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :title, presence: true
  validates :category, presence: true
end
