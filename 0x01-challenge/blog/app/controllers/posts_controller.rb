class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def post_params
    params.require(:post).permit(:title, :body, :online)
  end
  
  def index
    @posts = Post.where(online: true)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
