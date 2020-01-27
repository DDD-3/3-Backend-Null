class SessionsController < ApplicationController
  def create
    user = validate_user(request.env["omniauth.auth"])
    session[:user_id] = user.id
    render json: user
  end

  def destroy
    session[:user_id] = nil
    render json: {
      status: "signed out"
    }
  end

  private
  def validate_user(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first_or_initialize
    user.provider = auth.provider
    user.uid = auth.uid
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)

    user.name = auth.info.name    
    user.email = auth.info.email
    
    user.save
    return user
  end
end
