class Exercise < ApplicationRecord
  belongs_to :category
  has_one_attached :asset

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
end
