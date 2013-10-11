class Company < ActiveRecord::Base
  belongs_to :headquarter
  validates :headquarter, :name, :street, :city, :country, :zipcode,
    presence: true

  def address
    "#{street}, #{zipcode}, #{city}, #{country}"
  end
end
