module Api
    module V1 
        module Shop
            class ProductsController < ApplicationController
                def create
                    # Product.create(create_params)
                    Product.create(
                        name: create_params[:name], 
                        price: create_params[:price], 
                        description:create_params[:description]
                    )
                    render json: { done: true }
                end

                private

                def create_params
                  params.require(:product).permit(:name, :price, :description)
                end
            end
        end
    end
end
