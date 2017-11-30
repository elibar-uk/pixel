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
    when "X"
      exit_session
    when "?"
      help
    end
  end

  def exit_session
    @running = false
  end

  def help
    help_text = <<~TEXT
        ? - Help
        I M N - Create a new M x N image with all pixels coloured white (O).
        C - Clears the table, setting all pixels to white (O).
        L X Y C - Colours the pixel (X,Y) with colour C.
        V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
        H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
        S - Show the contents of the current image
        X - Terminate the session
        TEXT

    puts help_text
  end

end
