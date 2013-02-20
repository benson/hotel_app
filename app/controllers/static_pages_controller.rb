class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def contact
  end

  def daily
    @rooms = Room.all  
  end

end
