class Driver < ActiveRecord::Base
  has_many :orders
  belongs_to :headquarter

  validates :headquarter, :name, :phone, :street, :city,
    :country, :zipcode, presence: true
end
