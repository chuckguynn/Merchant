class Order < ActiveRecord::Base
  attr_accessible :user, :status
  has_many :order_items, :dependent => :destroy
  has_many :products
  belongs_to :user, :foreign_key => :customer_id
def total
	order_items.collect(&:subtotal).sum
  end
end
