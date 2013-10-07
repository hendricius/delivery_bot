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

  private

  def set_current_capacity!
    self.capacity = 0
    true
  end

  def current_capacity_max
    if current_capacity && max_capacity && current_capacity > max_capacity
      errors.add :current_capacity, "Can not be higher than max capacity"
    end
  end

end
