class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    all.select {|x| !!x.inventory && x.inventory > 0 }
  end

  def currency_price
    price.to_f/100
  end
end
