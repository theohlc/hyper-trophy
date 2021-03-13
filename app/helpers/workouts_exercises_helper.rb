module WorkoutsExercisesHelper

    def next_exercise(workouts_exercise)
        workout = workouts_exercise.workout
        next_occurs = workouts_exercise.order_occurs + 1

        next_workouts_exercise = workout.workouts_exercises.find_by(order_occurs: next_occurs)
        if next_workouts_exercise
            edit_workout_workouts_exercise_path(workout, next_workouts_exercise)
        else
            edit_workout_path(workout)
        end
    end

end
