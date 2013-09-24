class Headquarter < ActiveRecord::Base
  has_many :companies
  has_many :drivers

  validates :name, presence: true
end
