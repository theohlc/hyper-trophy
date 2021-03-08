class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.integer :duration
      t.integer :num_exercises
      t.string  :category
      t.string  :name

      t.timestamps
    end
  end
end
