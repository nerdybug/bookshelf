class SessionsController < ApplicationController

    def new
        @user = User.new
        render 'login'
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user == nil
            flash[:none] = "That name does not exist. Please try again."
            redirect_to '/login'
        elsif @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:incorrect] = "That password is incorrect. Please try again."
            redirect_to '/login'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end
