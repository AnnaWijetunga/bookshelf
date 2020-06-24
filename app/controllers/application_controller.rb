class ApplicationController < ActionController::Base
    include SessionsHelper

    # experimenting
    protect_from_forgery with:: null_session

end
