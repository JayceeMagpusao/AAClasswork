class ArtworksController < ApplicationController
    #need to figure out how to filter by user.id index function
    def index
        render json: Artwork.find(params[artwork[artist_id]])
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save!
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
		render json: @artwork
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])

        if @artwork.destroy
            render json: @artwork
        else
            render json: "Can't destroy this artwork!"
        end
    end

    def artwork_params
        params.require(:artwork).permit(:title, :artist_id, :image_url)
    end

end