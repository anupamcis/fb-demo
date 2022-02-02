class PostController < ApplicationController
  def index
       
    case 
    when current_user.user_type=="user"
      post =Post.all
      @users =User.all
      @comments =Comment.all 
      current_user_posts=current_user.posts
      @posts=post-current_user_posts

    when current_user.user_type=="admin"
      redirect_to "/admin/home/indexadmin"
    end
  end

  def new
    @posts = Post.new 
  end

  def create
    @users=User.all
    @posts = Post.new(text:params["title"],image:params["image"],user_id:current_user.id)
    if @posts.save
      # debugger
      redirect_to indexp_url
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(text:params["text"])
      if @post.save  
        redirect_to indexp_url
      else
        render :edit
      end
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to indexp_url
  end


  private

  def find_post
  end

  
end
