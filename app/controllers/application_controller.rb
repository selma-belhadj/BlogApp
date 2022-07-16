class ApplicationController < ActionController::Base
    before_action :set_user

    def set_current_user
        Current.user = User.first
    end
end
