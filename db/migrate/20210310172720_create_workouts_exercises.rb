class CreateWorkoutsExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts_exercises do |t|
      t.integer :reps
      t.integer :sets
      t.integer :order_occurs
      t.integer :exercise_id
      t.integer :workout_id

      t.timestamps
    end
  end
end
