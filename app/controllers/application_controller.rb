class ApplicationController < ActionController::Base
  include Pundit
    def current_user
      User.find(params.dig('category', 'id'))
    end

end
