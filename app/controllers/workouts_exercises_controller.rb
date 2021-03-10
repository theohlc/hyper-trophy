class WorkoutsExercisesController < ApplicationController
  def edit
    @workouts_exercise = WorkoutsExercise.find(params[:id])
  end

  def update
    @exercise_name = params[:workouts_exercise][:exercise_name].capitalize
    @exercise =  Exercise.find_or_create_by(name: @exercise_name)
    @workouts_exercise = Workouts_Exercise.find(params[:workouts_exercise][:id])
    
    @workouts_exercise.update(
      reps:         params[:workouts_exercise][:reps]
      sets:         params[:workouts_exercise][:sets]
      exercise_id:  params[:workouts_exercise][:exercise_id]
    )

    next_exercise
  end
end
