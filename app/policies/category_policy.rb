class CategoryPolicy 

  attr_reader :user, :category

    def initialize(user, category)
      @user = user
      @post = category
    end
    def create?
      user.admin?
    end
    def update?
      user.admin?
    end
    def destroy?
      user.admin?
    end

end
