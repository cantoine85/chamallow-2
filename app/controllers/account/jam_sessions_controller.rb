class Account::JamSessionsController < ApplicationController
  def index
    if current_user
      @jam_sessions = current_user.jam_sessions
    else
      redirect_to root_path
    end
  end
end
