# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  include DefaultExercises
  has_one :exercise_log, dependent: :destroy
  has_many :exercises, dependent: :destroy

  after_commit :create_exercise_log, :create_default_exercises

  private

  def create_exercise_log
    ExerciseLog.create(user: self)
  end

  # Override Devise::Confirmable#after_confirmation
  def after_confirmation
    create_default_exercises
  end
end
