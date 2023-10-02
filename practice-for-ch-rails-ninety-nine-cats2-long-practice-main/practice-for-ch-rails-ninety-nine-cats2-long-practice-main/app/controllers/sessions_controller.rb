class SessionsController < ApplicationController

    def new 
        @user = User.new 
        render :new 
    end 

    def create 
        # @user = User.find_by_credentials(params[:user][:username],params[:user][:password]) 

        # if @user
        #     login(@user)
        #     redirect_to cats_url 
        # else
        #     @user = { username: params([:user][:username])}
        #     render :new
        # end 
        # if current_user 
        #     redirect_to cats_url 
        # else 
            login!
        # end 
    end 

    def destroy 
        if current_user
            reset_session_token
            :session_token = nil 
            logout!
        end
        
        
        redirect_to new_session_url
        
    end 

    



end 

