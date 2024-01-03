# frozen_string_literal: true

class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :asset

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true

  before_destroy :check_if_custom

  private

  def check_if_custom
    raise ActiveRecord::RecordNotDestroyed, 'Cannot destroy non-custom exercise' unless is_custom
  end
end
