class Timetable

  attr_accessor :driver_order_times, :orders, :drivers, :initial_table, :happenings

  def initialize(orders: [], drivers: [])
    self.orders = orders
    self.drivers = drivers
    self.driver_order_times = []
    # For reporting purposes, store what is happening.
    self.happenings = []
  end

  # Assigns orders to drivers
  def assign_based_on_algorithm!

    build_timetable!

    # Store the initial table for later reporting purposes
    self.initial_table = driver_order_times

    orders_count = orders.length

    while orders_count > 0 do
      fastest_combination = fastest
      self.happenings.push "Fastest driver: #{fastest_combination.driver.name} - #{fastest_combination.time} seconds - order_id: #{fastest_combination.order.id} for client #{fastest_combination.order.client.short_name}"

      # Assign the actual order to the fastest combination
      order = fastest_combination.order
      order.driver = fastest_combination.driver
      order.save

      # Remove the order from future calculations as it is assigned.
      remove_order!(order)

      # Increase the time the driver needs for other time combinations
      recalculate_driver_time!(fastest_combination.driver)

      orders_count = orders_count - 1
    end
  end

  # Build initial timetable and set it
  def build_timetable!
    orders.each do |order|
      drivers.each do |driver|
        add_driver_order_time(
          DriverOrderTime.new(driver: driver, order: order, time: driver.time_for_order(order))
        )
      end
    end
    driver_order_times
  end

  def add_driver_order_time(driver_order_time)
    self.driver_order_times += [driver_order_time]
  end

  # Returns the fastest driver order time.
  def fastest
    fastest = driver_order_times.first
    # Return nil if there are no other elements
    return nil unless fastest
    # Abort in case there is only one element
    return fastest if driver_order_times.length == 1
    driver_order_times.each do |driver_order_time|
      if driver_order_time.time < fastest.time
        fastest = driver_order_time
      end
    end
    fastest
  end

  # Removes all driver order times that contain a specific order
  def remove_order!(order)
    self.driver_order_times = driver_order_times.reject {|driver_order_time| driver_order_time.order == order }
    driver_order_times
  end

  # Returns all the unique orders.
  def orders_unique
    driver_order_times.map{|dto| dto.order}.uniq
  end

  # Returns all the timetable times
  def times
    driver_order_times.map{|dto| dto.time}
  end

  # Returns all the timetable unique drivers
  def drivers_unique
    driver_order_times.map{|dto| dto.order}.uniq
  end

  # Recalculates the time a driver needs based on his assigned orders.
  # FIXME due to maps api limitations this is a random value. This should
  # later be recaculated based on a navigation system.
  def recalculate_driver_time!(driver)
    # Get all the combinations for the driver
    combinations = driver_order_times.select {|driver_order_time| driver_order_time.driver == driver }
    # Recalculate the time for each
    combinations.each do |driver_order_time|
      driver_order_time.time = driver_order_time.driver.complex_tour_time(driver_order_time.order, driver_order_time.time)
    end
  end

  # Pretty print in string form what actually happened.
  def happenings_friendly
    result = ""
    happenings.each_with_index do |happening, index|
      if (happenings.length - 1) == index
        result += "#{happening}"
      else
        result += "#{happening}\n\n"
      end
    end
    result
  end

end
