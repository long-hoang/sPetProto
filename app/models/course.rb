class Course < ApplicationRecord
  belongs_to :user

  CATEGORIES = 
  [
    'MATH',
    'SCIENCE',
    'READING',
    'WRITING',
    'OTHER'
  ]
end
