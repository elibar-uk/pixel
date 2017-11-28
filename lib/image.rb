class Image

  DEFAULT_COLOUR = "O".freeze

  attr_accessor  :mapper

  def initialize(rows, coloums)
    @rows = rows
    @coloums = coloums
    @mapper = Array.new(coloums) { Array.new(rows, DEFAULT_COLOUR) }
  end

  def colourize(x, y, c)
    mapper[(y-1)][(x-1)] = c
  end

  def vertical(x, y1, y2, c)
    mapper[y1-1..y2-1].map!{ |m| m[x-1] = c }
  end
end
