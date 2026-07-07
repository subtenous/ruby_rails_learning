class Passenger
  attr_reader :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end

  def details
    "Name: #{@name}, Email: #{@email}"
  end
end

passenger = Passenger.new("Marcus", "marcuscameron@gmail.com")

puts passenger.name
puts passenger.email
puts passenger.details


class Flight
  attr_reader :from, :to
  attr_accessor :seats_available

  def initialize(from, to, seats_available)
    @from = from
    @to = to
    @seats_available = seats_available
  end

  def route
    "#{@from} to #{@to}"
  end

  def book_seat
    if @seats_available > 0
      @seats_available -= 1
      "Seat booked. #{@seats_available} seats remaining."
    else
      "No seats available"
    end
  end

  def reset_seats
    self.seats_available = 100
  end
end

flight = Flight.new("London", "Paris", 3)

puts flight.route
puts flight.seats_available
puts flight.book_seat
puts flight.seats_available

flight.seats_available = 10
puts flight.seats_available

