class UsersController < ApplicationController 

    before_action :require_logged_in, only: [:show]


    def home
    end

    def new
        @user = User.new 
    end

    def create
        if (user = User.create(user_params))
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else
            render 'new'
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end


    private

    def user_params
        params.require(:user).permit(
            :name, 
            :password, 
            :height, 
            :nausea, 
            :tickets, 
            :happiness, 
            :admin)
    end
end