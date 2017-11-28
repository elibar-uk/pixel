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

end
