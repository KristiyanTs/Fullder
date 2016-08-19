class ReservationMailer < ApplicationMailer
  default from: 'reservations@omnimenu.org'

  def confirming_reservation(user, restaurant)
    @user = user
    @restaurant = restaurant
    mail(to: @user.email, subject: "Confirming reservation")
  end
end
