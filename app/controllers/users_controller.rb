class UsersController < ApplicationController
    include UsersHelper

    def new
        @user = User.new
    end

    def create
        if User.find_by(name: user_params[:name])
            flash[:existing_user] = "That name is taken. Please try again."
            redirect_to signup_path
        else
            @user = User.create(user_params)
    		session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end

    def show
        current_user
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end
