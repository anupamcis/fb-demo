class MessageController < ApplicationController
  def indexm  
    @message= Message.all
  end

  def create
    if !Message.find_by(user_id:current_user.id,friends_id:params[:id],text:nil)
    
      Message.create(user_id:current_user.id,friends_id:params[:id])
      Message.create(user_id:params[:id],friends_id:current_user.id)

    end
      redirect_to message_indexm_path()
  end

  def friend_message
    $friendid = params[:id]
    j=0
    k=1
    @messages=Array.new
    message=Message.all
    message.each do|i|
      if (i.friends_id == params[:id].to_i && i.user_id==current_user.id) || (i.friends_id == current_user.id && i.user_id == params[:id].to_i) 
        while (j<k)
          @messages[j]=i
          j+=1
        end
        k+=1
      end
    end
  end
  
  def create_message
    message= Message.create(user_id:current_user.id,friends_id:$friendid,text:params[:text])
    redirect_to friend_message_path($friendid)
  end

  # def destroy
  #   id = Message.find(params[:id]).user_id
  #   Message.find(params[:id]).destroy
  #   Message.find(params[:id].to_i+1).destroy
  #   if Message.find_by(user_id:id)
  #     Message.find_by(user_id:id).destroy
  #   end
  #   if Message.find_by(friends_id:id)
  #     Message.find_by(friends_id:id).destroy
  #   end
  #   redirect_to message_indexm_path()
  # end

end
