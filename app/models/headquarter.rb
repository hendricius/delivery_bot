class Headquarter < ActiveRecord::Base
  has_many :companies
  has_many :drivers
end
