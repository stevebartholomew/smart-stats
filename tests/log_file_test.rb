require_relative 'test_helper'
require 'log_file'

describe LogFile do
  let(:log_file) { LogFile.new(fixture_path(path)) }

  before do
    log_file.parse!
  end

  describe 'parsing a valid log file' do
    let(:path) { 'inputs/valid.log' }

    it 'parses entries' do
      entries = log_file.entries
      assert_equal 14, entries.size
    end
  end

  describe 'parsing a corrupted log file' do
    let(:path) { 'inputs/corrupted.log' }

    it 'captures errors' do
      errors = log_file.errors
      assert_equal 6, errors.size
    end
  end
end
