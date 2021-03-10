class WorkoutsExercisesController < ApplicationController
  def edit
    @workouts_exercise = WorkoutsExercise.find(params[:id])
  end

  def update
    binding.pry
    @exercise_name = params[:workouts_exercise][:exercise_name].capitalize
    @exercise =  Exercise.find_or_create_by(name: @exercise_name)
    @workouts_exercise = find(params[:workouts_exercise][:id])
    
  end
end
