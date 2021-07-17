class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery

    # before_action :current_user

    def current_user
      User.find(params.dig('category', 'id'))
    end

end
