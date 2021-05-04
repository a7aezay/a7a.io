class ThoughtsController < ApplicationController
  def index 
    @thoughts = current_user.thoughts
  end
end
