class Order < ActiveRecord::Base
  CAPACITY = Driver::CAPACITY
  acts_as_gmappable

  belongs_to :company
  belongs_to :driver
  belongs_to :client

  validates :client, :company, presence: true
  # Order can have 1..3 capacity
  validates :capacity, inclusion: { in: CAPACITY }

  scope :open, -> { where(driver_id: nil) }

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street}, #{self.city}, #{self.country}" 
  end

  delegate :city, :street, :zipcode, :country, to: :client

  def address
    "#{street}, #{zipcode}, #{city}, #{country}"
  end

end
