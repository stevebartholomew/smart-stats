require_relative '../test_helper'
require 'renderers/text'

describe Renderers::Text do
  let(:report) { double(title: 'My Report', results: results) }
  let(:renderer) { Renderers::Text.new(reports: [report], errors: errors) }

  let(:results) do
    [
      double(page: 'top', count: 10),
      double(page: 'next-item', count: 5)
    ]
  end

  let(:errors) do
    [
      [1, 'hello']
    ]
  end

  let(:expected) do
    <<~EXPECTED
      [My Report]

      top      10
      next-item 5

      Found errors on the following lines:

      Line 1: "hello"
    EXPECTED
  end

  it 'renders correctly' do
    assert_equal expected, renderer.render
  end
end
