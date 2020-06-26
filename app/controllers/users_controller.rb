class UsersController < ApplicationController
    # experimenting with before filter to allow access to Heroku/OAuth
    skip_before_action :protect_from_forgery

    # experimenting
    # protect_from_forgery prepend: true
    # skip_before_filter :verify_authenticity_token

    def index
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end

    def edit
    end

    def create
        @user = User.new(user_params)
        if @user.save
          log_in @user
          flash[:success] = "Welcome to Bookshelf!"
          redirect_to @user
        else
          render :new
        end
    end

    def update
    end

    def destroy
    end

    # tells Rails which parameters are allowed to be submitted
    # through the form to the database
    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def auth
      request.env['omniauth.auth']
    end
end
