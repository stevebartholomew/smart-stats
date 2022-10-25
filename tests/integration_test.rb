require 'english'
require_relative 'test_helper'

describe 'smart-stats' do
  let(:exit_status) { $CHILD_STATUS.exitstatus }

  before do
    @output = `ruby parser.rb #{log}`
  end

  describe 'parsing a valid log file' do
    let(:expected) { fixture('outputs/valid') }
    let(:log) { './tests/fixtures/inputs/valid.log' }

    it 'outputs statistics' do
      assert_equal exit_status, 0, 'expected command to run'
      assert @output.present?

      assert_equal expected, @output
    end
  end

  describe 'file does not exist' do
    let(:expected) { fixture('outputs/missing') }
    let(:log) { './made/up/path/to/some.log' }

    it 'shows an error' do
      assert_equal exit_status, 1, 'expected command to error'
      assert @output.present?

      assert_equal expected, @output
    end
  end

  describe 'file is empty' do
    let(:expected) { fixture('outputs/empty') }
    let(:log) { './tests/fixtures/inputs/empty.log' }

    it 'shows an error' do
      assert_equal exit_status, 1, 'expected command to error'
      assert @output.present?

      assert_equal expected, @output
    end
  end

  describe 'file with errors' do
    let(:expected) { fixture('outputs/with_errors') }
    let(:log) { './tests/fixtures/inputs/corrupted.log' }

    it 'shows an error' do
      assert_equal exit_status, 0, 'expected command to run'
      assert @output.present?

      assert_equal expected, @output
    end
  end
end
