class ApplicationController < ActionController::Base
    include SessionsHelper

    # experimenting with before filter to allow access to Heroku/OAuth
    skip_before_filter :protect_from_forgery
    
end
