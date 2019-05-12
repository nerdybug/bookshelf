class SessionsController < ApplicationController

    def new
        @user = User.new
        render 'login'
    end

    def create
        # available when coming back from github
        auth = request.env["omniauth.auth"]
    
        if auth
            omniauth_login_or_create(auth)
        else
            login_with_name_password
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def omniauth_login_or_create(auth)
        @user = User.find_or_create_with_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_books_path(@user)
    end

    def login_with_name_password
        @user = User.find_by(name: params[:user][:name])
        if @user == nil
            flash[:none] = "That name does not exist. Please try again."
            redirect_to '/login'
        elsif @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_books_path(@user)
        else
            flash[:incorrect] = "That password is incorrect. Please try again."
            redirect_to '/login'
        end
    end
end
