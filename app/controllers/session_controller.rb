class SessionController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    uset = Uset.find_by(name: params[:name])
    if uset and uset.authenticate(params[:password])
      session[:uset_id] = uset.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:uset_id] = nil
    redirect_to store_url, notice: "Logged out"
  end
end
