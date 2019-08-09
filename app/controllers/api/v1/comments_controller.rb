# frozen_string_literal: true

module Api
  module V1
    # good
    class CommentsController < ApplicationController
      before_action :set_comment, only: %i[show update destroy]
      def_param_group :comment do
        param :text, String
        param :user_id, :number
        param :product_id, :number
        param :comment_id, :number, 'not necessarily'
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
        @comment = Comment.new(comment_params)

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

        render json: @comment, status: :ok
      end

      api :GET, '/v1/comments/user_comments/:user_id', 'Return all user`s comments'
      def user_comments
        @comments = Comment.where(user_id: params[:user_id])

        render json: @comments, status: :ok
      end

      api :GET, '/v1/comments/nested_comments/:comment_id', 'Return all nested comments of comment'
      def nested_comments
        @comments = Comment.where(comment_id: params[:comment_id])

        render json: @comments, status: :ok
      end

      api :GET, '/v1/comments/product_comments/:product_id', 'Return all comments of product'
      def product_comments
        @comments = return_dto_object(params[:product_id], :product_id)

        render json: @comments.to_json, status: :ok
      end

      private

      # DTO methods that return user for each comment and based on that serialized json
      def return_dto_object(id, column)
        Comment.where(column => id)
               .includes(:user)
               .map do |a|
                 {
                   'id' => a.id,
                   'text' => a.text,
                   'user_name' => a.user['username']
                 }
               end
      end

      # Good
      def set_comment
        @comment = Comment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def comment_params
        params.permit(:id, :text, :user_id, :product_id, :comment_id)
      end
    end
  end
end
