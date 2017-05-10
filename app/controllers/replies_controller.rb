class RepliesController < ApplicationController
  before_action :post_find, only: [:create, :destroy]

  def create
      @reply = @post.replies.create(reply_params)
      redirect_to post_path(@post)
    end

  def destroy
      @reply = @post.replies.find(params[:id])
      @reply.destroy
      redirect_to post_path(@post)
    end

  private
      def reply_params
        params.require(:reply).permit(:reply_user, :body)
      end

      def post_find
        @post = Post.find(params[:post_id])
      end

end
