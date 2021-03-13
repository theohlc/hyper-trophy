class Exercise < ApplicationRecord
    has_many :workouts_exercises
    has_many :workouts, through: :workouts_exercises

    validates :name, presence: true, uniqueness: true, allow_nil: true
end
