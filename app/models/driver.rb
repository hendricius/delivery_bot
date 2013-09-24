class Driver < ActiveRecord::Base
  has_many :orders
  belongs_to :headquarter
end
