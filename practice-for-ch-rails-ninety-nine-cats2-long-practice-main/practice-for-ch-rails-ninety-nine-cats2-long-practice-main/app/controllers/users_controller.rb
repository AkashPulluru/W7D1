class UsersController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    # before_action :require_logged_in, only: [:index, :show, :edit, :update]
    def new
        render :new 
    end 

    def create
        @user = User.new(user_params)

        if @user.save 
            login(@user)
            redirect_to user_url(@user)
        else 
            render json: @users.error.full_messages, status: 422
        end 

    end 


    private 

    def user_params
        params.require(:user).permit(:username)
        params.require(:user).permit(:username, :password)
    end 


end 