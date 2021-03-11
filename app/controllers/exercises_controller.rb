class ExercisesController < ApplicationController
    def index
        @exercises = Exercise.all
    end

    def show
    end

end
