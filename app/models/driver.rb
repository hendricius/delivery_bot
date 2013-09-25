class Driver < ActiveRecord::Base
  has_many :orders
  belongs_to :headquarter

  validates :headquarter, :name, :phone, :street, :city,
    :country, :zipcode, presence: true

  validates :max_capacity, inclusion: { in: (1..10) }
  validate :current_capacity_max

  before_validation :set_current_capacity!, on: :create

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
