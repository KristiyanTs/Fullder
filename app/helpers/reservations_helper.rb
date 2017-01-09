module ReservationsHelper
  def from_to(from, to, step = 15.minutes)
    [from].tap { |array| array << array.last + step while array.last < to }
  end
end
