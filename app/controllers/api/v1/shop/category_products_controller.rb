module Api
    module V1
        module Shop
            class CategoryProductsController < ApplicationController

                def create
                    category.products << product
                    render json: { done: true }
                end
                  
                # def create
                #     product.categories << category
                #     render json: { done: true }
                # end
                
                def category
                    Category.find(create_params[:category_id])
                end
                
                def product
                    Product.find(create_params[:product_id])
                end
                
                private
                
                def create_params
                    params.require(:category_product).permit(:category_id, :product_id)
                end
            end
        end
    end
end