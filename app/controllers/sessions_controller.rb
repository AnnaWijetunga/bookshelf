class SessionsController < ApplicationController
    # use to allow access to Heroku/OAuth
    skip_before_action :protect_from_forgery, raise: false

    def new
    end

    def create
        if params[:session]
          user = User.find_by(email: params[:session][:email])
          valid_regular_user(user)
        else
          user = User.create_by_google(auth)
          valid_google_user(user)
        end
    end

    def destroy
        log_out
        flash[:success] = "Bye, catch you next time!"
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end