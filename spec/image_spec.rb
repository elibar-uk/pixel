require 'image'

describe Image do
  subject(:image) { described_class.new(5, 6) }

  it "initializes with right amount rows ad coloums" do
    expect(image.mapper).to eq([["O","O","O","O","O"],
                                ["O","O","O","O","O"],
                                ["O","O","O","O","O"],
                                ["O","O","O","O","O"],
                                ["O","O","O","O","O"],
                                ["O","O","O","O","O"]])
  end

  describe "#colourize" do
    it "change pixel colour to given" do # L 2 3 A (L X Y C)
      image.colourize(2, 3, "A")
      expect(image.mapper).to eq([["O","O","O","O","O"],
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
      expect(image.mapper).to eq([["O","O","O","O","O"],
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
      expect(image.mapper).to eq([["O","O","O","O","O"],
                                  ["O","O","Z","Z","O"],
                                  ["O","O","O","O","O"],
                                  ["O","O","O","O","O"],
                                  ["O","O","O","O","O"],
                                  ["O","O","O","O","O"]])
    end
  end

end
