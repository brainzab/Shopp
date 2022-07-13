class ShoppingCart
  attr_reader :sum, :items

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

  def to_s
    @items
      .tally
      .map { |item, amount| "#{item.info} X #{amount} шт. = #{item.price * amount} руб." }
      .join("\n")
  end
end
