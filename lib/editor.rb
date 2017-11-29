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
  
end
