class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params[:reservation])
    if @reservation.save
      flash[:success] = "Successfully added #{@reservation.start} - #{@reservation.end}!"
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
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end
end
