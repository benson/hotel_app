class RoomTypesController < ApplicationController
  layout "webapp"
  def new
    @room_type = RoomType.new
  end

  def create
    @room_type = RoomType.new(params[:room_type])
    if @room_type.save
      flash[:success] = "Successfully added #{@room_type.name}!"
      redirect_to room_types_path
    else
      render :new
    end
  end

  def show
    @room_type = RoomType.find(params[:id])
  end

  def edit
    @room_type = RoomType.find(params[:id])
  end

  def update
    @room_type = RoomType.find(params[:id])
    if @room_type.update_attributes(params[:room_type])
      flash[:success] = "RoomType updated"
      redirect_to @room_type
    else
      render 'edit'
    end
  end

  def index
    # @room_types = Customer.paginate(page: params[:page])
    @room_types = RoomType.all
  end

  def destroy
    @room_type = RoomType.find(params[:id])
    @room_type.destroy
    redirect_to room_types_path
  end
end
