class Headquarter < ActiveRecord::Base

  attr_accessor :timetable

  has_many :companies
  has_many :drivers

  validates :name, presence: true

  # This assigns all the open orders to a driver, picking those drivers that
  # have the best time.
  def assign_orders!
    timetable = Timetable.new(orders: open_orders, drivers: drivers)
    timetable.assign_based_on_algorithm!
    # Store the timetable for later use.
    self.timetable = timetable
    timetable
  end

  def orders
    Order.where(company_id: companies.select("id"))
  end

  def open_orders
    Order.where(company_id: companies.select("id")).open
  end
end
