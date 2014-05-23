describe ConfigurationParser, '.parse' do
  it 'parses `set :foo, "bar"`' do
    result = ConfigurationParser.parse('set :foo, "bar"')

    expect(result).to eq({ foo: "bar" })
  end

  it 'parses multiple lines of `set :foo, "bar"`' do
    configuration = <<-EOS
      set :foo, "bar"
      set :other, 3
    EOS

    result = ConfigurationParser.parse(configuration)

    expect(result).to eq({ foo: "bar", other: 3 })
  end

  it 'can nest configuration' do
    configuration = <<-EOS
      configure :blog do
        set :root, "/blog"
      end
    EOS

    result = ConfigurationParser.parse(configuration)

    expect(result).to eq({ blog: { root: "/blog" } })
  end

  it 'can nest configuration arbitrarily deep' do
    configuration = <<-EOS
      configure :blog do
        configure :second_level do
          set :hello, :there
          configure :inception do
            set :park, :place
          end
        end
      end
    EOS

    result = ConfigurationParser.parse(configuration)

    expect(result).to eq({
      blog: {
        second_level: {
          hello: :there,
          inception: {
            park: :place
          }
        }
      }
    })
  end
end
