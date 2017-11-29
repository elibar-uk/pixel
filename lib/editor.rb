require './lib/image'

class Editor

attr_reader :image

COMMANDS =   {
   'I' => :create,
   'H' => :horizontal,
   'V' => :vertical,
   'L' => :colourize,
   'C' => :clear,
   'S' => :show
 }.freeze

  def create(*args)
    @image = Image.new(*args)
  end

  def run
    input = $stdin.gets.chomp
    command, *args = input.split(" ")
    case command
    when "I"
      create(*args)
    end
  end

end
