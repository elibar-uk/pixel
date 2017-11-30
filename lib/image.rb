class Image

  DEFAULT_COLOUR = "O".freeze

  attr_accessor  :canvas

  def initialize(rows, coloums)
    @rows = rows
    @coloums = coloums
    @canvas = Array.new(coloums.to_i) { Array.new(rows.to_i, DEFAULT_COLOUR) }
  end

  def colourize(x, y, c)
    canvas[(y.to_i-1)][(x.to_i-1)] = c
  end

  def vertical(x, y1, y2, c)
    canvas[y1.to_i-1..y2.to_i-1].map!{ |m| m[x.to_i-1] = c }
  end

  def horizontal(x1, x2, y, c)
    i = x1.to_i-1
    while i <= x2.to_i-1
      canvas[y.to_i-1][i] = c
      i += 1
    end
  end

  def clear
    canvas.each { |m| m.map!{ |n| n = DEFAULT_COLOUR } }
  end

  def show
    canvas.each { |m| puts m.join("") }
  end

end
