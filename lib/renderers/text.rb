require 'renderers/renderer'

module Renderers
  class Text < Renderer
    def render
      [
        render_reports,
        render_errors
      ].compact.join
    end

    private

    def render_reports
      reports.map do |report|
        erb template('report'), binding
      end
    end

    def render_errors
      return if errors.empty?

      erb template('errors'), binding
    end

    # @todo format the spacing to match the longest result
    def format_result(result)
      format('%-8s %s', result.page, result.count)
    end
  end
end
