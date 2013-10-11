class DriverOrderTime
  attr_accessor :driver, :order, :time

  def initialize(driver: nil, order: nil, time: nil)
    method(__method__).parameters.each do |type, k|
      next unless type == :key
      v = eval(k.to_s)
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

end
