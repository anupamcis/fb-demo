class Admin::HomeController < ApplicationController
  def indexadmin
    @posts=Post.all
  end
  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_home_indexadmin_path
  end
end
