class ScoresController < ApplicationController
  def index
    @scores = Score.all
  end

  def show
    @score = Score.find params[:id]
  end
end
