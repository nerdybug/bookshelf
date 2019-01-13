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
            redirect_to shelf_path
        end
    end

    def show
        current_user
    end

    def shelf
        current_user
        render :shelf
    end

    def edit
        current_user
    end

    def update
        current_user
        if !user_params[:password].empty?
            @user.update(password: user_params[:password])
            redirect_to user_path(@user)
        elsif user_params[:name] != @user.name
            @user.update(name: user_params[:name])
            redirect_to user_path(@user)
        else
            flash[:no_changes] = "You did not make any changes. Please try again."
            redirect_to edit_user_path(@user)
        end
    end

    def destroy
        current_user
        @user.destroy
        session.delete :user_id

        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end
