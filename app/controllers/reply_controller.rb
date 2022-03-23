class ReplyController < ApplicationController 

  def indexr
    @users=User.all
    comments=Comment.all
    @replies=Array.new
    i=0
    j=1
    comments.each do|comment| 
      if comment.coment_id != nil
        if comment.coment_id == params[:id].to_i
          while (i<j)
            @replies[i] = comment
            i+=1
          end
          j+=1
        end
      end
    end
    @repliescount=i
  end

  def new
    @replies = Comment.new
    $commentid=params[:id]
  end

  def create
    @replies = Comment.new(text:params["title"],post_id:$postid.id,userid:current_user.id,coment_id:$commentid)
    if @replies.save
      redirect_to comment_index_path($postid.id)
    else
      render :new
    end
  end
end