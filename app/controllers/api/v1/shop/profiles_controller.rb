module Api
    module V1 
        module Shop
            class ProfilesController < ApplicationController
        
                def create
                    @profile = current_user1.create_profile(create_params) # profile and user is one to one association.
                    render json: @profile
                end

                def index
                    @profiles = Profile.all
                    render json: @profiles
                    
                end


                def update
                   profile.update(name: params[:profile][:name])
                   render json: { done: true }
                end

                def destroy
                    profile.destroy
                    render json: { done: true }
                end


                private 

                def create_params 
                   params.require(:profile).permit(:name, :cid, :contact_number, :address,:id)
                end

                def profile
                   Profile.find(params[:id])
                end
            end
        end
    end
end
