class StaticPagesController < ApplicationController

  def home
    @thought = Thought.new
    @thoughts = Thought.where('created_at > ?', 7.hours.ago)
  end

  def help
  end

  def about
  end
end
