class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def new
        @blogger = Blogger.new
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def create
        @blogger = Blogger.create(blogger_params)
        redirect_to blogger_path(@blogger)
    end

    def edit
        @blogger = Blogger.find(params[:id])
    end

    def update
        @blogger = Blogger.find(params[:id])
        @blogger.update(blogger_params)
        redirect_to bloggers_path
    end

    def destroy
        Blogger.destroy(params[:id])
        redirect_to bloggers_path
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end

end
