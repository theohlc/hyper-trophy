class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index, :show ]

    def index
        @users = User.all 
    end 
    
    def show
    end

end
