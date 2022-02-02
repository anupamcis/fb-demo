class CommentController < ApplicationController
  def index
    @users=User.all
    @comments=Comment.all
    @postcomments = Post.find(params[:id]).comments
    # debugger
    @replies=Array.new
    i=0
    j=1
    @comments.each do|comment| 
      if comment.coment_id != nil
        while (i<j)
          @replies[i] = comment
          i+=1
        end
        j+=1
      end
      
    end
    # debugger
    $postid=Post.find(params[:id])
    @commentcount=commentcount()
  end
  
  def create
    @comments = Comment.new(text:params["title"],post_id:$postid.id,userid:current_user.id)
    if @comments.save
      redirect_to comment_index_path($postid.id)
    else
      render :new
    end
  end
  
  def edit
    @comments = Comment.find(params[:id])
  end

  def update
    @comments = Comment.find(params[:id])
    @comments.update(text:params["text"])
      if @comments.save  
        redirect_to root_url
      else
        render :edit
      end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to comment_index_path($postid.id)
  end

  def commentcount
    sum=0
    @postcomments.each do |i|
      if i.coment_id == nil
        sum+=1
      end
    end
    return sum
  end  
end
