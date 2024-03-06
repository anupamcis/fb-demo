class PostController < ApplicationController
  before_action :post_find ,only: [:edit,:update,:destroy]

  def index
    case 
    when current_user.user_type=="user"     
      post =Post.order(created_at: :desc) 
      current_user_posts=current_user.posts
      posts = post-current_user_posts
      @posts = posts.shuffle
    when current_user.user_type=="admin"
      redirect_to "/admin/home/indexadmin"
    end
  end

  def new 
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to indexp_url
  end

  def edit
  end

  def update
    @post.update(text:params["text"])
    if @post.save  
      redirect_to indexp_url
    end
  end

  def destroy
    @post.destroy
    redirect_to user_friend_path
  end  

  private
  
  def post_find
      @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:text, :image)
  end
end
