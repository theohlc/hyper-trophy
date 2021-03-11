class ExercisesController < ApplicationController
    def index
        if params[:id]
            if user = User.find_by(id: params[:id])
                @exercises = user.exercises
            else
                redirect_to exercises_path
            end
        else
          @exercises = Exercise.all
        end
    end

    def show
        @exercise = Exercise.find(params[:id])
    end

end
