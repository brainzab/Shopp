class Product
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def info
    raise NotImplementedError
  end

  def to_s
    "#{info}, #{@price} руб. (осталось #{@amount})"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  def out_of_stock?
    @amount <= 0
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end
end
