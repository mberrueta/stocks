module StocksApi

  class << self
    def method_missing(m)
      key = m.to_s
      return Rails.configuration.stocks_api[key] if Rails.configuration.stocks_api.key?(key)
      super
    end

    def env
      return '-' if Rails.env == 'production'
      Rails.env
    end
  end

end
