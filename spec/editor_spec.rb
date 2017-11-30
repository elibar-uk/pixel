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

  describe "#execute_command" do
    context "when input command is 'I'" do
      let(:input) { 'I 1 2' }
      it "creates the image" do
        allow(STDIN).to receive(:gets) { input }
        expect(editor).to receive(:create).with("1","2")
        editor.execute_command(input)
      end
    end
    context "when input command is X" do
      let(:input) { 'X' }
      it "exits the session" do
        allow(STDIN).to receive(:gets) { input }
        expect(editor).to receive(:exit_session)
        editor.execute_command(input)
      end
    end
  end
end
