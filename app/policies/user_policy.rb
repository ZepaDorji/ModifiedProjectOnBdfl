class UserPolicy
  attr_reader :user, :model

    def initialize(user, model)
      @user_current = user
      @user = model
    end
    def create?
      @user_current.admin?
    end
    def update?
      @user_current.admin?
    end
    def destroy?
      @user_current.admin?
    end
end
