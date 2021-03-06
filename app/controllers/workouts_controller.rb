class WorkoutsController < ApplicationController
  before_action :check_user_owned, only: [ :update, :edit, :destroy ]

  def new
    @workout = Workout.new
  end

  def create
    params[:workout][:category].capitalize!
    @workout = current_user.workouts.new(workout_params)
    if @workout.save
      for i in 1..@workout.num_exercises do
        workouts_exercise = @workout.workouts_exercises.new(order_occurs: i, exercise_id: 1)
        workouts_exercise.save(validate: false)
      end
      redirect_to edit_workout_workouts_exercise_path(@workout, @workout.first_exercise)
    else
      render :new
    end
  end

  def update
    params[:workout][:category].capitalize!
    @workout = Workout.find(params[:id])

    @workout.update(workout_params)

    render :edit
  end

  def edit
    @workout = Workout.find(params[:id])
    redirect_to workout_path(@workout) if @workout.user != current_user
  end

  def destroy
    workout = Workout.find(params[:id])
    workout.destroy
    redirect_to user_path(current_user)
  end

  def index
    @workouts = Workout.all
  end

  def show
    if params[:id].to_i == 0
      @workouts = Workout.where('category = ?', params[:id])
      render :index
    else
      @workout = Workout.find(params[:id])
      clear_empty_rows(@workout)
      @author = @workout.user
    end
  end
  
  def my_workouts
    @workouts = current_user.workouts
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :category, :duration, :num_exercises)
  end

  def clear_empty_rows(workout)
    workout.workouts_exercises.each do |workouts_exercise|
      workouts_exercise.destroy unless workouts_exercise.valid?
    end
  end

end
