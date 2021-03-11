class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index, :show ]

    def index
        @users = User.all 
    end 
    
    def show
        @user = User.find(params[:id])
        @workouts = @user.workouts
        @exercises = @user.exercises
    end

end
