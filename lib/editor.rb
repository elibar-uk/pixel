require './lib/image'

class Editor

COMMANDS =   {
   'I' => :create,
   'H' => :horizontal,
   'V' => :vertical,
   'L' => :colourize,
   'C' => :clear,
   'S' => :show
 }.freeze

end
