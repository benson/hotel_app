class StaticPagesController < ApplicationController
  layout "webapp", only: :daily 
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
