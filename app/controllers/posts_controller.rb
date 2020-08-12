class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]

  def index
    @post = Post.all.order('created_at DESC')
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "投稿が確認できました"
      redirect_to root_path
    else    
      @post = Post.new
      flash.now[:alert] = "投稿できません、もう一度入力してください"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @comment = Comment.new
    @comments = @post.comment.includes(:user)
  end

private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text).merge(user_id: current_user.id)
  end
end
