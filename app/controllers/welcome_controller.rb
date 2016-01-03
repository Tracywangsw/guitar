class WelcomeController < ApplicationController

  def index
    puts "!!!!", session[:user_id]
    # @courses = Course.all
    push = get_push_images
    @columns = push[:column]
    @ads = push[:ad]
  end

  private
    def get_push_images
      push = Hash.new
      push[:column] = Course.where(is_recommend: true)
      push[:ad] = Advertisement.on
      return push
    end
end
