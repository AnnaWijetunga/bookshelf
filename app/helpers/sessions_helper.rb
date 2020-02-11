module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    def valid_regular_user(user)
        if user && user.authenticate(params[:session][:password])
          log_in user
          flash[:success] = "Glad you're here, #{user.name.capitalize}!"
          redirect_to user
        else
          flash.now[:danger] = "Invalid email or password."
          render :new
        end
    end

    def valid_google_user(user)
        log_in(user)
        flash[:success] = "Glad you're here, #{user.name.capitalize}!"
        redirect_to user
    end
end