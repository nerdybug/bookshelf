class SessionsController < ApplicationController

    def new
        @user = User.new
        render 'login'
    end

    def create
        @user = User.find_by(name: params[:session][:name])
        if @user && user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/login'
        end
    end
end
