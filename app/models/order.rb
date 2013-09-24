class Order < ActiveRecord::Base
  belongs_to :company
  belongs_to :driver
  belongs_to :client

  validates :client, :company, presence: true
end
