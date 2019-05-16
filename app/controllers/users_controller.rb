class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        
        if !@user.errors.empty?
            render :action => 'new'
          else
            session[:user_id] = @user.id
            redirect_to user_books_path(@user)
          end
    end

    def show
        current_user
    end

    def edit
        current_user
    end

    def update
        current_user
        if user_params[:name] == @user.name && @user.authenticate(user_params[:password]) 
            flash[:no_changes] = "You did not make any changes. Please try again."
            redirect_to edit_user_path(@user)
            return
        end
        @user.update(user_params)
        if !@user.errors.empty?
            current_user
            render :action => 'edit'
        else
            redirect_to user_path(@user)
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
