class StaticPagesController < ApplicationController
  layout "webapp", only: [:daily, :quickres]
  def home
  end

  def help
  end

  def contact
  end

  def daily
    @rooms = Room.all  
  end

  def quickres
    @customers = Customer.all
    @rooms = Room.all
    @companies = Company.all
  end

end
