class WelcomeController < ApplicationController

  def index
    puts "!!!!", session[:user_id]
    @courses = Course.all
    push = get_push_images
    @columns = push[:column]
    @ads = push[:ad]
  end

  private
    def get_push_images
      push = Hash.new
      push[:column] = Column.where(is_recommend: true).first(4)
      push[:ad] = Advertisement.on.first(1)
      return push
    end
end
