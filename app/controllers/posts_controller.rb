class PostsController < ApplicationController
    before_action :set_post, only: %i[show edit update destroy publish unpublish]
  
    def index
      @posts = Post.all
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path, notice: 'Post was successfully created.'
      else
        render 'new'
      end
    end
  
    def show
    end
  
    def publish
      @post.update(published: true)
      redirect_to posts_path
    end
  
    def unpublish
      @post.update(published: false)
      redirect_to posts_path
    end
  
    def edit
    end
  
    def update
      if @post.update(post_params)
        redirect_to posts_path, notice: 'Post was successfully updated.'
      else
        render 'edit'
      end
    end
  
    def destroy
      if @post.destroy
        flash[:notice] = 'Post was successfully deleted.'
      else
        flash[:alert] = 'Failed to delete the post.'
      end
      redirect_to posts_path
    end
  
    private
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :content)
    end
  end