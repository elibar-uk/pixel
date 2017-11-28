require 'image'

describe Image do
  subject(:image) { described_class.new(5, 6) }

  it "initializes with right amount rows ad coloums" do
    expect(image.mapper).to eq([["O","O","O","O","O","O"],
                                ["O","O","O","O","O","O"],
                                ["O","O","O","O","O","O"],
                                ["O","O","O","O","O","O"],
                                ["O","O","O","O","O","O"]])
  end

  describe "#colourize" do
    it "change pixel colour to given" do # L 2 3 A (L X Y C)
      image.colourize(2, 3, "A")
      expect(image.mapper).to eq([["O","O","O","O","O","O"],
                                  ["O","O","O","O","O","O"],
                                  ["O","A","O","O","O","O"],
                                  ["O","O","O","O","O","O"],
                                  ["O","O","O","O","O","O"]])
    end
  end

end
