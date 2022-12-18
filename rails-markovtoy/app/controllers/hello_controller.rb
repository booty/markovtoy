class HelloController < ApplicationController
  def index
    @texts = Text.all.order(:title)
  end

  def show_stuff
  end
end
