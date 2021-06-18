class ArtworkSharesController < ApplicationController
    def create
        @artwork_share = Artwork_share.new(artwork_share_params)
        if @artwork_share.save!
            render json: @artwork_share
        else
            render json: @artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork_share = Artwork_share.find(params[:id])

        if @artwork_share.destroy
            render json: @artwork_share
        else
            render json: "Can't destroy this share!"
        end
    end

    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end

end