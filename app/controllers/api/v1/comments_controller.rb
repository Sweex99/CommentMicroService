module Api
  module V1
    # good
    class CommentsController < ApplicationController
      before_action :set_comment, only: %i[show update destroy]
      def_param_group :comment do
        param :comment, Hash do
          param :text, String
          param :user_id, :number
          param :product_id, :number
        end
      end

      api :GET, '/v1/comments', 'Show all comments'
      def index
        @comments = Comment.all

        render json: @comments
      end

      api :GET, '/v1/comments/:id', 'Show comment'
      def show
        render json: @comment
      end

      api :POST, '/v1/comments', 'Create new comment'
      param_group :comment
      def create
        @comment = ::Comment.new(comment_params)

        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment, status: :unprocessable_entity
        end
      end

      api :PUT, '/v1/comments/:id', 'Update comment'
      param_group :comment
      def update
        if @comment.update(comment_params)
          render json: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      api :DELETE, '/v1/comments/:id', 'Destroy Comment'
      def destroy
        @comment.destroy

        render json: @comment, status: :destroyed
      end

      private

      # Good
      def set_comment
        @comment = Comment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def comment_params
        params.require(:comment).permit(:text, :user_id, :product_id)
      end
    end
  end
end
