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
    @running = true
    while @running
      print '> '
      input = gets.chomp
      execute_command(input)
    end
  end

  def execute_command(input)
    command, *args = input.split(" ")
    case command
    when "I"
      create(*args)
    end
  end

  def exit_session
    @running = false
  end
end
