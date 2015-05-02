class ApplicationController < ActionController::Base
  before_action :authorize # usun to a testy magicznie zadziałają
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authorize
    unless Uset.find_by(id: session[:uset_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
end
