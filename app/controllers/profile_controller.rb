class ProfileController < ApplicationController
  
  def indexp
    @postscurrent = User.find(current_user.id).posts
    @postcount = postcount()
    @friendcount = friendcount()
  end
  

  def userprofile
    @posts =Post.all
    @users=User.find(params[:id])
    @userpost = @users.posts
    @postscurrent = User.find(current_user.id).posts

    @postcount = postcount()
    @friendcount = friendcount()

  end

  def userpost
    @postscurrent = User.find(current_user.id).posts
  end
  

  def friendcount()
    count=0
    friends=Friendlist.all
    friends.each do |friend|
      if friend.current_user_id == current_user.id
        count+=1
      end
    end
    return count
  end

  def postcount()
    count=0
    @postscurrent.each do|i|
      count+=1
    end
    return count
  end

end
