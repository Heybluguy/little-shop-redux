class Item < ActiveRecord::Base
  validates_presence_of :title, :description, :price, :image, :merchant_id
  belongs_to :merchant
  belongs_to :category
  scope :abc_order, -> {order('lower(title)')}

  def self.average_price
    average(:price).round(2)
  end

  def self.newest_item
    order("created_at DESC").first.title
  end

  def self.oldest_item
    order("created_at").first.title
  end

end
