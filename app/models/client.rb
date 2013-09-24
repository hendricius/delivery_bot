class Client < ActiveRecord::Base
  has_many :orders
  validates :first_name, :last_name, :city, :street, :zipcode, :country,
    presence: true
end
