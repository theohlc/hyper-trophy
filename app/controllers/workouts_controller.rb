class WorkoutsController < ApplicationController
  
  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.create(workout_params)
    for i in 1..@workout.num_exercises do
      @workout.workouts_exercises.create(order_occurs: i)
    end
    redirect_to edit_workout_workouts_exercise_path(@workout, @workout.first_exercise)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    @workout = Workout.find(params[:id])
    @author = @workout.user
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :category, :duration, :num_exercises)
  end

end
