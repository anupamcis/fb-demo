# class LikeController < ApplicationController
#   def indexlike
#     @likes = Like.create(post_id:(params[:id]).to_i,user_id:current_user.id).save
#     debugger
#     if @clicks != nil
#       @clicks = @clicks + 1
#     else
#       @clicks = 0
#     end
#     @likecount=likecount()
#     # debugger
#   end

#   def likecount
#     sum=0
#     postlikes = Like.all
#     postlikes.each do |i|
#       if i.post_id == params[:id].to_i
#         sum+=1
#       end
#     end
#     return sum
#   end
# end


class LikeController < ApplicationController
  def indexlike
    vari = Post.find(params[:id])
    @likes = Like.new(post_id:vari.id,user_id:current_user.id)
    if !(Like.find_by(user_id: current_user.id, post_id:vari.id))
      if current_user != vari.user
        if @likes.save
          flash[:success]='Thanks for your like'
          redirect_to post_index_path(vari)
        else
        render :new
        end
      else
        flash[:warning]="You can't like your article"
        redirect_to like_indexlike_path(vari)
      end
    else
      flash[:danger]='You liked this article once'
      redirect_to post_index_path(vari)      
    end
    likecount=likecount()
  end

  def likecount
    sum=0
    postlikes = Like.all
    postlikes.each do |i|
      if i.post_id == params[:id].to_i
        sum+=1
      end
    end
    return sum
  end
end