class WelcomeController < ApplicationController
    def index
        if session[:user_id]
            render :'users/home'
        else
            render :index
        end
    end
end
