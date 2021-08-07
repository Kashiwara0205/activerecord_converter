class Question < ApplicationRecord
  has_many :question_tags
  belongs_to :member
end
