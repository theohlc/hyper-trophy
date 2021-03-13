class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    private

    def check_user_owned
        if params[:workout_id]
            w = Workout.find(params[:workout_id])
            redirect_to root unless w.user == current_user
            if params[:id]
                redirect_to root unless w == WorkoutsExercise.find(params[:id]).workout
            end
        else
            w = Workout.find(params[:id])
            redirect_to root unless w.user == current_user
        end
    end
    
end
