module ConfigurationParser
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

  private_constant :Proxy
end
