module Api
    module V1 
        module Shop
            class CategoriesController < ApplicationController
                def create
                    current_user.categories.create(name: create_params['name'])
                    render json: { done: true }
                end

                def index
                    render json: current_user.categories.all 
                end

                def show 
                    render json: Category.find(params[:id])
                end

                def update
                   category.update(name: params[:category][:name])
                   render json: { done: true }
                end

                def destroy
                    category.destroy
                    render json: { done: true }
                end


                private 

                def create_params 
                   params.require(:category).permit(:name, :id)
                end

                def category
                   Category.find(params[:id])
                end
            end
        end
    end
end
