class ProfilePolicy

    attr_reader :user, :profile
  
      def initialize(user, profile)
        @current_user = user
        @profile = profile
      end

      def create?
        @current_user.admin? 
      end
      def destroy?
        @current_user.admin?
      end
end
