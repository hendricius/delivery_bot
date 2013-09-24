class Order < ActiveRecord::Base
  belongs_to :company
  belongs_to :driver
end
