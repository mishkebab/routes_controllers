class CommentsController < ApplicationController


    def create
        @comment = Comment.new(comments_params)
        if @comment.save
            render json: @comment, status: :created 
        else 
            render json: @comment.errors.full_messages, status: 422
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: @comment
    end

    private
    def comments_params
        params.require(:comment).permit(:body, :author_id, :artwork_id)
    end 
end