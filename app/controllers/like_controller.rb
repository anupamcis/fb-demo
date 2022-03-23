class LikeController < ApplicationController
  def index_like
    vari = Post.find(params[:id])
    @likes = Like.new(post_id:vari.id,user_id:current_user.id)
    if !(Like.find_by(user_id: current_user.id, post_id:vari.id))
      if current_user != vari.user
        if @likes.save
          flash[:success]='Post liked successfully'
          redirect_to post_index_path(vari)
        end
      else
        flash[:warning]="You can't like your post"
        redirect_to user_friend_path(vari)
      end
    else
      flash[:danger]='Post Unliked successfully'
      @dest = Like.find_by(user_id:current_user.id,post_id:params[:id])
      @dest.destroy
      redirect_to post_index_path(vari)
    end
  end

  def liked_by
    @liked_by = Post.find(params[:id]).likes
  end
end