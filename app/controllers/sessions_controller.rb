class SessionsController < ApplicationController
    # experimenting with before filter to allow access to Heroku/OAuth
    skip_before_filter :protect_from_forgery

    # experimenting
    protect_from_forgery prepend: true

    # many methods moved to sessions_helper.rb to keep this clean

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