class Workout < ApplicationRecord
    belongs_to :user
    has_many   :workouts_exercises
    has_many   :exercises, through: :workouts_exercises

    validates :name,            uniqueness: true
    validates :category,        presence: true
    validates :num_exercises,   presence: true
    validates :duration,        presence: true
    

    def first_exercise
        self.workouts_exercises.find_by(order_occurs: 1)
    end
end
