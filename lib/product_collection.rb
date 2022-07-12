class ProductCollection
  attr_reader :products

  PRODUCT_TYPES = {
    film: { dir: 'films', class: Film },
    book: { dir: 'books', class: Book },
    disc: { dir: 'discs', class: Disc }
  }.freeze

  def self.from_dir(dir_path)
    products = []
    PRODUCT_TYPES.each do |_type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]
      Dir["#{dir_path}/#{product_dir}/*.txt"].each do |path|
        products << product_class.from_file(path)
      end
    end
    new(products)
  end

  def initialize(products = [])
    @products = products
  end

  def to_a
    @products
  end

  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by!(&:to_s)
    when :price
      @products.sort_by!(&:price)
    when :amount
      @products.sort_by!(&:amount)
    end
    @products.reverse! if params[:order] == :asc
    self
  end
end
