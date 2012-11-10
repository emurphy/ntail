module Ntail
  class LogLine

    # mandatory attributes
    attr_reader :raw_log_line
    attr_reader :log_line_regexp

    # derived attributes
    attr_reader :parsable
    attr_reader :components

    # optional attributes
    attr_reader :filename
    attr_reader :line_number

    def initialize(raw_log_line, log_line_regexp, filename = nil, line_number = nil)

      @filename = filename
      @line_number = line_number

      raise ArgumentError.new("Required 'raw_log_line' and 'log_line_regexp' parameters are missing") if raw_log_line.nil? && log_line_regexp.nil?

      raise ArgumentError.new("Required 'raw_log_line' parameter is missing") if raw_log_line.nil?
      raise ArgumentError.new("Paramter 'raw_log_line' should be a String") unless raw_log_line.is_a? String

      raise ArgumentError.new("Required 'log_line_regexp' parameter is missing") if log_line_regexp.nil?
      raise ArgumentError.new("Paramter 'log_line_regexp' should be a Regexp") unless log_line_regexp.is_a? Regexp

      @raw_log_line = raw_log_line
      @log_line_regexp = log_line_regexp

      full_regexp = Regexp.new('\A(?<prefix>.*?)' + log_line_regexp.to_s + '(?<suffix>.*?)\Z')

      if @parsable = !full_regexp.match(raw_log_line).nil?
        @components = Hash[*$~.names.map(&:to_sym).zip($~.captures).flatten]
      end

    end

    def to_s(format_string = nil)
      format_string ? sprintf(format_string, @components) : raw_log_line
    end

    def respond_to?(symbol, include_private = false)
      super || @components.keys.include?(symbol)
    end

    def method_missing(symbol, *args)
      @components.keys.include?(symbol) ? @components[symbol] : super
    end

  end
end