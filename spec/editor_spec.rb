require 'editor'

describe Editor do
  subject(:editor) { described_class.new }
  let(:image) { Image.new(1,2) } 

  it "has commands mapper" do
    expect(described_class::COMMANDS).to_not be(nil)
  end

  describe "#create" do
    it "creates new instance of Image" do
      expect(editor.create(1,2).canvas).to eq(image.canvas)
    end
  end

  describe "#run" do
    context "when input command is 'I'" do
      let(:input) { 'I 1 2' }
      it "creates the image" do
        allow(STDIN).to receive(:gets) {input}
        expect(editor).to receive(:create).with("1","2")
        editor.run
      end
    end
  end

end
