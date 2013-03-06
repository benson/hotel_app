class ReservationsController < ApplicationController
  layout "webapp"
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params[:reservation])
    if @reservation.save
      flash[:success] = "Successfully added #{@reservation.full_name}!"
      redirect_to reservations_path
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(params[:reservation])
      flash[:success] = "Reservation updated"
      redirect_to @reservation
    else
      render 'edit'
    end
  end

  def index
    # @reservations = Reservation.paginate(page: params[:page])
    @reservations = Reservation.all
    @rooms = Room.all
    @reservations_by_date = @reservations.group_by(&:start_date) 
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def table
    @reservations = Reservation.all
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end
end
