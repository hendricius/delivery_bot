class Driver < ActiveRecord::Base
  has_many :orders
  belongs_to :headquarter

  validates :headquarter_id, :name, :phone, presence: true
end
