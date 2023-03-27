class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  enum payment_method: { credit_card:0, transfer:1 }
  enum order_status: { waiting_for_payment:0, confirmed_the_payment:1, under_construction:2, ready_for_shipping:3, shipped:4 }
end
