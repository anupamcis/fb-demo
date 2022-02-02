class FriendlistController < ApplicationController
  
  def indexf
    
    @users = User.all
    # @friendlist=Friendlist.all
  end

  def create
    @friendlist=Friendlist.new(current_user_id:current_user.id,friends_id:params[:id]).save
    redirect_to '/indexf'
  end

  def friend
    @friendlist=Friendlist.all
    @users=User.all
  end

end