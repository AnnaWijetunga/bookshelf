class SessionsController < ApplicationController

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
        flash[:danger] = "Bye for now, and happy reading!"
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end