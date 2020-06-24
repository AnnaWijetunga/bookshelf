class ApplicationController < ActionController::Base
    include SessionsHelper

    # experimenting
    skip_before_filter :verify_authenticity_token

end
