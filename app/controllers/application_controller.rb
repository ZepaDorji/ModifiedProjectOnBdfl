class ApplicationController < ActionController::Base
  include Pundit
    def current_user
      User.find(params.dig('category', 'id'))
    end

    def current_user1
      User.find(params.dig('profile', 'id'))
    end

end
