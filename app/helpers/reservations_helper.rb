module ReservationsHelper
  def reservation_name(reservation)
    reservation.start.to_s + " - " + reservation.end.to_s + " in " + reservation.rooms.first.name
  end
end