class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    
        #GET /spices
        def index
            spices = Spice.all 
            render json: spices
        end
    
        #POST /spices
        def create
            spice = Spice.create(spice_params)
            render json: spice, status: :created
    
        end
    
        #PATCH /spices/:id
        def update
            spice = Spice.find(params[:id])
            spice.update(spice_params)
            render json: spice
        end
    
        #DELETE /spices/:id
        def destroy
            spice = Spice.find(params[:id])
            spice.destroy
            head :no_content
        end
    
        # Private
    
        def render_not_found
            render json: {error: "Spice Not Found"}, status: :not_found
        end
    
        def spice_params
            params.permit(:title, :image, :description, :notes, :rating)
        end
    
    end