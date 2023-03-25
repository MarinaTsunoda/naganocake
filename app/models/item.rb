class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    ["introduction", "name"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
