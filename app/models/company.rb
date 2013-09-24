class Company < ActiveRecord::Base
  belongs_to :headquarter
  validates :headquarter, :name, :street, :city, :country, :zipcode,
    presence: true
end
