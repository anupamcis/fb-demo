class Admin::UsersController < ApplicationController
  def index
    @users=User.all
  end

  def userprofile
    @posts =Post.all
    @users=User.find(params[:id])
    @userpost = @users.posts
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path
  end
end
