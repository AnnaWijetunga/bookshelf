class SessionsController < ApplicationController
    def new
    end

    def create
        # complete this method
    end

    def destroy
        # complete this method
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end