
  def indexf
    userid = Array.new
    user = Array.new
    user = User.all
    j=0
    k=1
    user.each do |i|
      if i.user_type != "admin"
        if i.id != current_user.id 
          while(j<k)
            userid[j] = i.id
            j+=1      
          end
          k+=1
        end
      end
    end
    @pending = Array.new
    friends = Array.new
    friendlist=Array.new
    friendlist=Friendlist.all
    j=0
    k=1
    m=0
    n=1
    friendlist.each do |l|
      if l.current_user_id == current_user.id
        if l.friendship_status == "f"
          while(m<n)
            @pending[m] = l.friends_id
            m+=1
          end
          n+=1
        end
        while(j<k)
          friends[j] = l.friends_id
          j+=1
        end
        k+=1
      end
    end
    @users = userid - friends
  end
   
  def create
    user = User.find(params[:id])
    @friendlist = Friendlist.new(current_user_id: current_user.id, friends_id: user.id, friendship_status: false)
    if !(Friendlist.find_by(current_user_id: current_user.id, friends_id:user.id, friendship_status: false))
      if current_user.id != user.id
        if @friendlist.save
          flash[:success]='Friend request send successfully'
          redirect_to '/indexf'
        else
        render :new
        end
      else
        flash[:warning]="You can't like your post"
        redirect_to '/indexf'
      end
    else
      flash[:danger]='Friend request send successfully'
      redirect_to '/indexf'      
    end
  end

  def friend_request
    @friendrequest = Array.new
    @friendlist = Friendlist.all
    j=0
    k=1
    @friendlist.each do |i|
      if i.friends_id == current_user.id
        if i.friendship_status == "f"
          while(j<k)
            @friendrequest[j]=i
            j+=1
          end
          k+=1
        end
      end
    end
  end

  def update
    if params[:id]
      Friendlist.find(params[:id]).update_attribute(:friendship_status, true)
      Friendlist.create(current_user_id:current_user.id,friends_id:Friendlist.find(params[:id]).current_user_id,friendship_status: true)
      flash[:success] = 'Friendship request accepted'
      redirect_to "/indexp"
    else
      flash[:danger] = 'Friendship request not accepted'
      redirect_to '/indexf'
    end
  end

  def destroy
    if params[:id]
      Friendlist.find(params[:id]).delete
      flash[:success] = 'Friend request canceled or Friend removed '
      redirect_to '/indexf'
    else
      flash[:danger] = 'Friendship request NOT canceled'
    end
  end

  def friend
    @friendlist=Friendlist.all
    @users=User.all
  end
end