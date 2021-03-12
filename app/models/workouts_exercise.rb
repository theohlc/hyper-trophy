class WorkoutsExercise < ApplicationRecord
    belongs_to :workout
    belongs_to :exercise 

    validates :reps, presence: true
    validates :sets, presence: true
    
end
