class WorkoutsExercisesController < ApplicationController
  def edit
    @workout = params[:workout_id]
    @workouts_exercise = WorkoutsExercise.find(params[:id])
    @exercise_name = @workouts_exercise.exercise.name
  end

  def update
    @exercise_name = params[:workouts_exercise][:exercise_name].capitalize
    @exercise =  Exercise.find_or_create_by(name: @exercise_name)
    @workouts_exercise = WorkoutsExercise.find(params[:id])
    
    @workouts_exercise.update(
      reps:         params[:workouts_exercise][:reps],
      sets:         params[:workouts_exercise][:sets],
      exercise_id:  params[:workouts_exercise][:exercise_id]
    )

    redirect_to helpers.next_exercise(@workouts_exercise)
  end

  def new
    workout = Workout.find(params[:workout_id])
    @exercise_name = nil
    @workouts_exercise = workout.workouts_exercises.build(order_occurs: (workout.workouts_exercises.last.order_occurs + 1))
  end

end
