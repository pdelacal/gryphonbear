class SessionsController < ApplicationController
  def login
    session[:id] = 1
    redirect_to :back
  end

  def logout
    reset_session
    redirect_to :back
  end
end
