class Driver < ActiveRecord::Base

  CAPACITY = (1..3)
  has_many :orders
  belongs_to :headquarter

  validates :headquarter, :name, :phone, :street, :city,
    :country, :zipcode, presence: true

  validates :max_capacity, inclusion: { in: CAPACITY }
  validate :current_capacity_max

  before_validation :set_current_capacity!, on: :create

  def address
    "#{street}, #{zipcode}, #{city}, #{country}"
  end

  def time_for_order(order)
    # FIXME right now this is just a random time. This should change once we
    # we have an API service that is not that expensive.
    rand(300..1800)
  end

  # FIXME this needs to return the tour time of all currently assigned orders.
  def complex_tour_time(order, time)
    time + orders.count * rand(300..1800)
  end

  # Build the route for Google maps
  def build_route
    start_point = address
    end_point = address
    waypoints = []
    orders.each do |order|
      # Go to the company first.
      waypoints << order.company.address
      # Go to the client after
      waypoints << order.address
    end
    direction_hash = {
      "direction" => {
        "data" => { "from" => start_point, "to" => end_point}
      }
    }
    if waypoints.length > 0
      direction_hash["direction"]["options"] = {"waypoints" => waypoints, "display_panel" => true, "panel_id" => "instructions"}
    end
    direction_hash
  end

  def build_route_human
    return ["Has no orders, will idle"] if orders.count == 0
    route = []
    route << "Start in #{address} <label class='label'>Start</label>"
    orders.each do |order|
      # Go to the company first.
      route << "Go to company #{order.company.name} - #{order.company.address} <label class='label label-warning'>Company</label>"
      # Go to the client after
      route << "Go to client #{order.client.short_name} - #{order.address} <label class='label label-success'>Client</label>"
    end
    route << "Return to #{address} <label class='label'>End</label>"
    route
  end

  private

  def set_current_capacity!
    self.current_capacity = 0
    true
  end

  def current_capacity_max
    if current_capacity && max_capacity && current_capacity > max_capacity
      errors.add :current_capacity, "Can not be higher than max capacity"
    end
  end

end
