class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create

        if user_params[:name].strip.empty? || user_params[:password].empty?
            flash[:invalid_params] = "Name and password are required. Please try again."
            redirect_to signup_path
            return
        end

        if User.find_by(name: user_params[:name])
            flash[:existing_user] = "That name is taken. Please try again."
            redirect_to signup_path
            return
        end

        @user = User.create(user_params)
        if @user.id == nil
            flash[:unable_to_create_user] = "Unable to create your user. Name and password are required. Please try again."
            redirect_to signup_path
            return
        end

        session[:user_id] = @user.id
        redirect_to user_books_path(@user)
    end

    def show
        current_user
    end

    def edit
        current_user
    end

    def update
        current_user
        if params[:user][:name] == @user.name && !params[:user][:password].present?
            flash[:no_changes] = "You did not make any changes. Please try again."
            redirect_to edit_user_path(@user)
        end
        if !params[:user][:password].empty?
            if !params[:user][:password] == @user.password
                @user.update(password: params[:user][:password])
                @user.save
                flash[:password_updated] = "Your new password has been saved."
                # this is broken
            else
                flash[:same_password] = "The password you entered is your current password. Please try again"
                redirect_to edit_user_path(@user)
            end
        elsif params[:user][:name] != @user.name
            @user.update(name: params[:user][:name])
            @user.save
            flash[:name_updated] = "Your new user name has been saved. #{@user.name}"
            render 'show' #redirect_to user_path(@user)
            # this shows the right name but doesnt carry back to home page
            # reloading the page reverts to the old user name
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
