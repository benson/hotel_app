module ReservationsHelper
  def reservation_name(reservation)
    reservation.start_date.to_s + " - " + reservation.end_date.to_s + " in " + reservation.rooms.first.name
  end
end