class Animal < ApplicationRecord
  belongs_to :animal_type
  belongs_to :countory

  validates :weight, numericality: true
  validates :height, numericality: true
end
