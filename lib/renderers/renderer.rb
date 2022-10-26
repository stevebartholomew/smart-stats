require 'erb'

module Renderers
  class Renderer
    attr_reader :reports, :errors

    def initialize(reports:, errors:)
      @reports = reports
      @errors = errors
    end

    def render
      raise 'implement in subclass'
    end

    private

    def template(name)
      File.read(File.join(File.dirname(__FILE__), 'text', "#{name}.erb"))
    end

    def erb(source, context)
      ERB.new(source, trim_mode: '-').result(context)
    end
  end
end
