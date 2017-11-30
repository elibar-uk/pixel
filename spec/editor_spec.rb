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

    context "when input command is '?'" do
      let(:input) { '?' }
      it "shows help" do
        allow(STDIN).to receive(:gets) { input }
        expect(editor).to receive(:help)
        editor.execute_command(input)
      end
    end

    context "when input command is H with agruments 1, 2, 3, 'C'" do
      let(:input) { 'H 1 2 3 C' }
      it "calls horizontal method on image" do
        image = editor.create("3","4")
        allow(STDIN).to receive(:gets) { input }
        expect(image).to receive(:horizontal).with("1", "2", "3", "C")
        editor.execute_command(input)
      end
    end

    context "when input command is H with agruments 1, 2, 3, 'C'" do
      let(:input) { 'L 1 2 C' }
      it "calls horizontal method on image" do
        image = editor.create("3","4")
        allow(STDIN).to receive(:gets) { input }
        expect(image).to receive(:colourize).with("1", "2", "C")
        editor.execute_command(input)
      end
    end

    context "when input command is H with agruments 1, 2, 3, 'C'" do
      let(:input) { 'V 1 2 3 C' }
      it "calls horizontal method on image" do
        image = editor.create("3","4")
        allow(STDIN).to receive(:gets) { input }
        expect(image).to receive(:vertical).with("1", "2", "3", "C")
        editor.execute_command(input)
      end
    end

    context "when input command is H with agruments 1, 2, 3, 'C'" do
      let(:input) { 'S' }
      it "calls horizontal method on image" do
        image = editor.create("1","2")
        allow(STDIN).to receive(:gets) { input }
        expect(image).to receive(:show)
        editor.execute_command(input)
      end
    end

    context "when input command is H with agruments 1, 2, 3, 'C'" do
      let(:input) { 'C' }
      it "calls horizontal method on image" do
        image = editor.create("1","2")
        allow(STDIN).to receive(:gets) { input }
        expect(image).to receive(:clear)
        editor.execute_command(input)
      end
    end
  end
end
