class JamSessionsController < ApplicationController
  def new
    @jam_session = JamSession.new
  end

  def create
    @jam_session = JamSession.new(jam_session_params)
    if @jam_session.save
      redirect_to jam_session_path(@jam_session)
    else
      render :new
    end
  end

  def show
  end

  private

  def jam_session_params
    params.require(:jam_session).permit(:title, :description, :location, :date)
  end
end
