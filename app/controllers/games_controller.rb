class GamesController < ApplicationController

  def start
    init_game
    redirect_to play_path
  end

  def play
    refresh
    @q = choose_question
    set_current_question(@q) if @q
    redirect_to end_path if complete?(@q)
  end

  def answer
    refresh
    unless answer_question(session[:current_question], params[:answer])
      redirect_to end_path
    else
      redirect_to play_path
    end
  end

  def end
    refresh
    @guesses = session[:possibilities].map{ |name| Animal.where(name: name).first }
    session[:history] = []
  end

end
