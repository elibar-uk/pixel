class Image

  DEFAULT_COLOUR = "O".freeze

  attr_accessor  :mapper

  def initialize(rows, coloums)
    @rows = rows
    @coloums = coloums
    @mapper = Array.new(rows) { Array.new(coloums, DEFAULT_COLOUR) }
  end

  def colourize(x, y, c)
    mapper[(y-1)][(x-1)] = c
  end

end
