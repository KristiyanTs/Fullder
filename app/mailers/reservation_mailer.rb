class ReservationMailer < ApplicationMailer
  default from: 'reservations@fullder.com'

  def confirming_reservation(user, restaurant, reservation)
    @user = user
    @restaurant = restaurant
    @reservation = reservation
    mail(to: @user.email, subject: "Confirmation awaiting")
  end

  def confirmed_reservation(user, restaurant, reservation)
    @user = user
    @restaurant = restaurant
    @reservation = reservation
    mail(to: @user.email, subject: "Confirmed reservation")
  end
end
