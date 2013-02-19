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
