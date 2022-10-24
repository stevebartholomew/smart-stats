require 'minitest/autorun'

describe 'smart-stats' do
  let(:expected) { File.read('./tests/fixtures/outputs/valid') }
  let(:exit_status) { $?.exitstatus }

  before do
    @output = %x(ruby parser.rb ./tests/fixtures/inputs/valid.log)
  end

  it 'outputs statistics' do
    assert_equal exit_status, 0, 'expected command to run'
    assert @output.present?

    assert_equal expected, @output
  end
end
