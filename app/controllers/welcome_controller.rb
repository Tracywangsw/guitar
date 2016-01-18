class WelcomeController < ApplicationController

  def index
    puts "!!!!", session[:user_id]
    # @courses = Course.all
    push = get_push_images
    @courses = push[:course]
    @ads = push[:ad]
  end

  private
    def get_push_images
      push = Hash.new
      push[:course] = Course.where(is_recommend: true)
      push[:ad] = Advertisement.on
      return push
    end
end
