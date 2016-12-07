class JamSessionsController < ApplicationController

  def index
    @jam_sessions = JamSession.all
  end

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
    @jam_session = JamSession.find(params[:id])
    render 'jam_sessions/show', jam_session: @jam_session
  end

  private

  def jam_session_params
    params.require(:jam_session).permit(:title, :description, :location, :date)
  end
end
