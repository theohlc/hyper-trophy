class WorkoutsExercisesController < ApplicationController
  def edit
    @workouts_exercise = WorkoutsExercise.find(params[:id])
  end

  def update
  end
end
