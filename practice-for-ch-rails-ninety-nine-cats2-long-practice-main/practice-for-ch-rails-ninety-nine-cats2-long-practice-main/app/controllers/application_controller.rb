class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?


    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!
        # @user = User.find_by_credentials(params[:user][:username],params[:user][:password]) 

        # if @user
        #     new_session_url
        # else
        #     @user = { username: params([:user][:username])}
        #     render :new
        session[:session_token] = user.reset_session_token!
    end 
    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def require_logged_out
        redirect_to users_url if logged_in?
    end

    def logged_in?
        !!current_user
    end


end