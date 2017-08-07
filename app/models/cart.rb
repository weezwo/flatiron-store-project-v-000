class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    line_items.map{|x| x.item.price * x.quantity}.inject(:+)
  end

  def add_item(item_id)
    if line_item = line_items.find_by("item_id = ?", item_id)
    else
      line_item = self.line_items.build(item_id: item_id)
    end
    line_item.quantity += 1
    line_item
  end

  def init_checkout
    line_items.each do |line_item|
      update_item_stock(line_item)
    end
    update(status: "submitted")
    user.remove_cart
  end

  def update_item_stock(line_item)
    item = Item.find(line_item.item_id)
    item.inventory -= line_item.quantity
    item.save
  end
end
