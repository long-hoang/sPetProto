class Course < ApplicationRecord
  belongs_to :user
  has_many :sections

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true

  CATEGORIES = 
  [
    'MATH',
    'SCIENCE',
    'READING',
    'WRITING',
    'OTHER'
  ]
end
