class WorkoutsExercisesController < ApplicationController
  before_action :check_user_owned

  def edit
    @workout = Workout.find(params[:workout_id])
    @workouts_exercise = WorkoutsExercise.find(params[:id])
    @exercise_name = @workouts_exercise.exercise.name
  end

  def update
    exercise_name = params[:workouts_exercise][:exercise_name].capitalize
    exercise =  Exercise.find_or_create_by(name: exercise_name)
    @workouts_exercise = WorkoutsExercise.find(params[:id])
    
    @workouts_exercise.update(
      reps:         params[:workouts_exercise][:reps],
      sets:         params[:workouts_exercise][:sets],
      exercise_id:  exercise.id
    )
    
    redirect_to helpers.next_exercise(@workouts_exercise)
  end

  def new
    @workout = Workout.find(params[:workout_id])
    @exercise_name = nil
    if @workout.workouts_exercises.empty?
      @workouts_exercise = @workout.workouts_exercises.build(order_occurs: 1)
    else
      @workouts_exercise = @workout.workouts_exercises.build(order_occurs: (@workout.workouts_exercises.last.order_occurs + 1))
    end
  end

  def create
    workout = Workout.find(params[:workout_id])
    exercise_name = params[:workouts_exercise][:exercise_name].capitalize
    exercise = Exercise.find_or_create_by(name: exercise_name)

    workout.workouts_exercises.create(
      order_occurs: params[:workouts_exercise][:order_occurs],
      reps:         params[:workouts_exercise][:reps],
      sets:         params[:workouts_exercise][:sets],
      exercise_id:  exercise.id
    )

    redirect_to edit_workout_path(workout)
  end

  def destroy
    WorkoutsExercise.find(params[:id]).destroy
    redirect_to edit_workout_path(params[:workout_id])
  end

end
