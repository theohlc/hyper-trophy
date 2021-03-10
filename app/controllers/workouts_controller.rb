class WorkoutsController < ApplicationController
  
  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.create(workout_params)
    redirect_to workout_path(@workout)
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
