class ProfileController < ApplicationController
  before_action :counting 

  def indexp
  end
  
  def user_profile
    @users=User.find(params[:id])
    @userpost = @users.posts
  end

  def user_post
    @postscurrent = User.find(current_user.id).posts
  end
  
  def requestcount()
    count=0
    friends=Friendlist.all
    friends.each do |friend|
      if friend.friends_id == current_user.id
        if friend.friendship_status == "f" 
          count+=1
        end
      end
    end
    return count
  end
  
  def friendcount()
    count=0
    friends=Friendlist.all
    friends.each do |friend|
      if friend.current_user_id == current_user.id
        if friend.friendship_status != "f" 
          count+=1
        end
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

  private
  
  def counting
    @postscurrent = User.find(current_user.id).posts
    @postcount = postcount()
    @friendcount = friendcount()
    @requestcount = requestcount()
  end

end
