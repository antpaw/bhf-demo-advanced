class UserSessionsController < ApplicationController
  before_filter :require_no_user, only: [:new, :create]
  before_filter :require_user, only: :destroy
  protect_from_forgery with: :reset_session

  layout 'bhf/application'

  def new
    @user_session = UserSession.new
    @title = 'Admin Login'
  end

  def create
    us = params[:user_session]
    us[:remember_me] = us['remember_me'].to_i != 0
    @user_session = UserSession.new(us)
    if @user_session.save
      session[:is_admin] = true
      session[:admin_account_id] = @user_session.user.id
      flash[:notice] = 'Login erfolgreich!'
      redirect_to bhf.root_url
    else
      render action: :new
    end
  end

  def logout
    session[:is_admin] = false
    session[:admin_account_id] = nil
    current_user_session.destroy if current_user_session
    redirect_to root_url, notice: 'Sie wurden ausgeloggt!'
  end

end