class SampleClass
    attr_accessor :user

    def initialize(user)
        @user = user
    end

    def call
        c_cp && p_cp
    end

    private

    def c_cp
        category.products << product
    end

    def p_cp
        product.categories << category
    end

    def product
        Product.create(name: 'Shirt S', price: 234.22, description: 'This is a shirt')
    end

    def category 
         user.categories.create(name: 'Shirt')
    end
end