include AI

class GamesController < ApplicationController

  def start
    init_game
    redirect_to play_path
  end

  def play
    refresh
    @q = choose_question
    set_current_question(@q) if @q
  end

  def answer
    refresh
    answer_question(session[:current_question], params[:answer])
    redirect_to games_index_path
  end

end
