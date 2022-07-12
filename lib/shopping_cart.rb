class ShoppingCart
  attr_reader :items, :sum

  def initialize
    @items = []
    @sum = 0
  end

  def add_item(item)
    @items << item
    item.amount -= 1
    @sum += item.price
  end

  def to_a
    @items
  end
end
