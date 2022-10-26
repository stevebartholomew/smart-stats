class LogFile
  module Parsers
    IP_MATCHER = /[0-9a-zA-Z]+(\.|:)/.freeze

    # @params ip [String] ipv4/ipv6-like ip string
    # @note intentionally not rigid here - trade off is light-weight validation without risking false errors
    def self.ip(ip)
      ip if ip =~ IP_MATCHER
    end

    # @params path [String]
    # @note light-weight validation as trade-off against full URL parsing
    def self.path(path)
      path if path[0] == '/'
    end

    # @params line [String] space separted path and ip
    def self.line(line)
      columns = line.split(/\s+/)[0..1]
      parsers = [method(:path), method(:ip)]

      parsers.each_with_index.map do |parser, index|
        parser.call(columns[index])
      end.compact
    end
  end
end
