class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_oauth(oauth)
    if user
      session[:user_id] = user.id
    else
      flash[:errors] = "Login unsuccessful, please try again."
    end
    redirect_to session[:back_to] || user_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def new
    session[:back_to] = request.referrer
    redirect_to login_tweet_path
  end

  private

  def oauth
    request.env['omniauth.auth']
  end
end
