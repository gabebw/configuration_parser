require "configuration_parser/version"

module ConfigurationParser
  def self.parse(string)
    proxy = Proxy.new
    proxy.instance_eval(string)
    proxy.hash
  end

  class Proxy
    def initialize
      @hash = {}
    end

    attr_reader :hash

    private

    def set(value, other_value)
      @hash[value] = other_value
    end

    def configure(nest, &block)
      nester = Proxy.new
      nester.instance_eval(&block)
      @hash[nest] = nester.hash
    end
  end
end
