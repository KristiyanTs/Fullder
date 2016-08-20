class ReservationMailer < ApplicationMailer
  default from: 'reservations@omnimenu.org'

  def confirming_reservation(user, restaurant, reservation)
    @user = user
    @restaurant = restaurant
    @reservation = reservation
    mail(to: @user.email, subject: "Confirming reservation")
  end
end
