class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?


    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!
        @user = User.find_by_credentials(params[:user][:username],params[:user][:password]) 

        if @user
            new_session_url
        else
            @user = { username: params([:user][:username])}
            render :new
        end 
    end 



end