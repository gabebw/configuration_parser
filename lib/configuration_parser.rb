require "configuration_parser/version"
require "configuration_parser/proxy"

module ConfigurationParser
  def self.parse(string)
    proxy = Proxy.new
    proxy.instance_eval(string)
    proxy.hash
  end
end
