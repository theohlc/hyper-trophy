class Workout < ApplicationRecord
    belongs_to :user
    has_many   :workouts_exercises
    has_many   :exercises, through: :workouts_exercises

    def first_exercise
        self.workouts_exercises.find_by(order_occurs: 1)
    end
end
