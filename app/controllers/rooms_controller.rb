class RoomsController < ApplicationController
  layout "webapp"
  def new
    @room = Room.new
    @room.build_room_type
  end

  def create
    @room = Room.new(params[:room])
    if !params[:room][:room_type_id].empty? && !params[:room][:room_type_attributes][:name].empty?
      flash[:warning] = "You can't select an existing room type and create a new one at the same time."
      render :new and return
    end
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
    @res_by_date = Hash.new
    @reservations.each do |res|
      @res_dates = res.start_date..res.end_date
      @all_reservations.concat @res_dates.to_a
      @res_dates.to_a.each do |date|
        if @res_by_date.values_at(date.to_s) == [nil]
          @res_by_date[date.to_s] = []
        end
        @res_by_date[date.to_s] << res
        # @res_by_date[date.to_s] = @res_by_date.values_at(date).empty? ? res : @res_by_date[date.to_s].
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

  def daily
    @rooms = Room.all 
  end
end
