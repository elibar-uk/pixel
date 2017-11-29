require 'image'

describe Image do
  subject(:image) { described_class.new(5, 6) }

  it "initializes with right amount rows ad coloums" do
    expect(image.canvas).to eq([["O","O","O","O","O"],
                                ["O","O","O","O","O"],
                                ["O","O","O","O","O"],
                                ["O","O","O","O","O"],
                                ["O","O","O","O","O"],
                                ["O","O","O","O","O"]])
  end

  describe "#colourize" do
    it "changes pixel colour to given" do # L 2 3 A (L X Y C)
      image.colourize(2, 3, "A")
      expect(image.canvas).to eq([["O","O","O","O","O"],
                                  ["O","O","O","O","O"],
                                  ["O","A","O","O","O"],
                                  ["O","O","O","O","O"],
                                  ["O","O","O","O","O"],
                                  ["O","O","O","O","O"]])
    end
  end

  describe "#vertical" do # V 2 3 4 W (V X Y1 Y2 C)
    it "draws vertical colouration" do
      image.vertical(2, 3, 4, "W")
      expect(image.canvas).to eq([["O","O","O","O","O"],
                                  ["O","O","O","O","O"],
                                  ["O","W","O","O","O"],
                                  ["O","W","O","O","O"],
                                  ["O","O","O","O","O"],
                                  ["O","O","O","O","O"]])
    end
  end

  describe "#horizontal" do
    it "draws horizontal colouration" do # H 3 4 2 Z (H X1 X2 Y C)
      image.horizontal(3, 4, 2, "Z")
      expect(image.canvas).to eq([["O","O","O","O","O"],
                                  ["O","O","Z","Z","O"],
                                  ["O","O","O","O","O"],
                                  ["O","O","O","O","O"],
                                  ["O","O","O","O","O"],
                                  ["O","O","O","O","O"]])
    end
  end

  describe "#clear" do
    it "sets pixels to default colour" do #C
      image.horizontal(3, 4, 2, "Z")
      image.clear
      expect(image.canvas).to eq([["O","O","O","O","O"],
                                  ["O","O","O","O","O"],
                                  ["O","O","O","O","O"],
                                  ["O","O","O","O","O"],
                                  ["O","O","O","O","O"],
                                  ["O","O","O","O","O"]])
    end
  end

  describe "#show" do
    it "prints out output" do #S
      expect {image.show}.to output("OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\n"
                              ).to_stdout
    end
  end
end
