class ArtworkSharesController < ApplicationController

    def create
        @artworkshare = ArtworkShare.new(artwork_shares_params)
        if @artworkshare.save
            render json: @artworkshare, status: :created 
        else 
            render json: @artworkshare.errors.full_messages, status: 422
        end
    end

    def destroy
        @artworkshare = ArtworkShare.find(params[:id])
        @artworkshare.destroy
        render json: @artworkshare
    end

    private
    def artwork_shares_params
        params.require(:artworkshare).permit(:artwork_id, :viewer_id)
    end 
end