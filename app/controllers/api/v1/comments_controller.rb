class Api::V1::CommentsController < ApplicationController
    
    # before_action :authenticate_user!
    def index
      @comments = Comment.all
  
      render json: @comments, status: :ok
    end
  
    def show
      @comment = Comment.find(params[:id])
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            render json: @comment, status: :ok
        else
          render json: comment.errors, status: :unprocessable_entity
        end
    end

    private

    def comment_params
      params.permit(:text, :post_id, :user_id)
    end
  end