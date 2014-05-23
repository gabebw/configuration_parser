describe ConfigurationParser, '.parse' do
  it 'parses `set :foo, "bar"`' do
    result = ConfigurationParser.parse('set :foo, "bar"')

    expect(result).to eq({ foo: bar })
  end
end
