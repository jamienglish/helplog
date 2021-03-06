class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :render_index_view

  private

  def authenticate
    render json: { errors: 'forbidden' }, status: :forbidden unless logged_in?
  end

  def render_index_view
    return if request.format == Mime::JSON
    return if request.xhr?

    respond_to do |format|
      format.html { render 'pages/home' }
    end
  end

  def logged_in?
    session[:current_user] != nil
  end
  helper_method :logged_in?
end
