class StandardExercise < ApplicationRecord
    belongs_to :category, foreign_key: 'category_id'
    has_one_attached :asset
  
    validates :name, presence: true, uniqueness: true
    validates :category, presence: true
end
