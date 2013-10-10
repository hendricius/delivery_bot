class Headquarter < ActiveRecord::Base
  has_many :companies
  has_many :drivers

  validates :name, presence: true

  def assign_orders!
    open_orders.each do |order|
      order.driver_id = drivers.sample.id
      order.save
    end
  end

  def orders
    Order.where(company_id: companies.select("id"))
  end

  def open_orders
    Order.where(company_id: companies.select("id")).open
  end
end
