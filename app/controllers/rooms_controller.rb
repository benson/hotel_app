class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params[:room])
    if @room.save
      flash[:success] = "Successfully added #{@room.name}!"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservations = @room.reservations.all
    @all_reservations = []
    @res_by_date = []
    @reservations.each do |res|
      @res_dates = res.start_date..res.end_date
      @all_reservations.concat @res_dates.to_a
      @res_dates.to_a.each do |date|
        @res_by_date = res
      end
    end
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(params[:room])
      flash[:success] = "Room updated"
      redirect_to @room
    else
      render 'edit'
    end
  end

  def index
    # @rooms = Customer.paginate(page: params[:page])
    @rooms = Room.all
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end
end
