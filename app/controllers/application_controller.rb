class ApplicationController < ActionController::Base
  include Pundit
    #before_action :user!#current_user

    def current_user
      User.find(params.dig('category', 'id'))
    end

end
