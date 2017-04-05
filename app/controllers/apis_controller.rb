class ApisController < ApplicationController
  @@token="weixintokentest1988"

  def notify
    # render plain: params.inspect
    # p params.inspect
    # return check_signature?(params[:signature],params[:timestamp],params[:nonce])
    if check_signature?(params[:signature],params[:timestamp],params[:nonce])
     return render plain: params[:echostr]
    end
  end


  private
    def check_signature?(signature,timestamp,nonce)  
      Digest::SHA1.hexdigest([timestamp,nonce,@@token].sort.join) == signature  
    end
end
