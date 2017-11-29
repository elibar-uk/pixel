require 'editor'

describe Editor do
  subject(:editor) { described_class.new }

  it "has commands mapper" do
    expect(described_class::COMMANDS).to_not be(nil)
  end

  describe "#create" do
    let(:image) { Image.new(1,2) }
    it "creates new instance of Image" do
      expect(editor.create(1,2).canvas).to eq(image.canvas)
    end
  end

end
