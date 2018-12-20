module UsersHelper
    
    def current_user
        @user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        if !current_user
            redirect_to login_path
        end
    end
end