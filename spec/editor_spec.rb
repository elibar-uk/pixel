require 'editor'

describe Editor do
  subject(:editor) { described_class.new }

  it "has commands pointig to" do
    expect(described_class::COMMANDS).to_not be(nil)
  end

end
