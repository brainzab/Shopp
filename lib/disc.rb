class Disc < Product
  attr_reader :album, :performer, :genre, :year

  def self.from_file(file_path)
    lines = File.readlines(file_path).map { |line| line.chomp }
    self.new(
      album: lines[0],
      performer: lines[1],
      genre: lines[2],
      year: lines[3],
      price: lines[4],
      amount: lines[5]
    )
  end

  def initialize(params)
    super

    @album = params[:album]
    @performer = params[:performer]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом #{performer} — «#{album}», #{genre}, #{year}"
  end

  def update(params)
    super
    @album = params[:album] if params[:album]
    @performer = params[:performer] if params[:performer]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end
end