class PostsController < ApplicationController

    def index

    end

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.create(post_params)
        redirect_to post_path(@post)
    end

    def like
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :destination_id, :blogger_id)
    end

end
