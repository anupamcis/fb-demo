class HomeController < ApplicationController
  
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[current_user.id])
  end

  def update
    # debugger
    @user = User.find(params[:id])
    if @posts.update()
      redirect_to @posts
  end
end
