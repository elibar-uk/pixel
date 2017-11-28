class Image
  DEFAULT_COLOUR = "O".freeze
  
  attr_accessor  :mapper

  def initialize(rows, coloums)
    @rows = rows
    @coloums = coloums
    @mapper = Array.new(rows) { Array.new(coloums, DEFAULT_COLOUR) }
  end


end
