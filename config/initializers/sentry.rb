Sentry.init do |config|
    config.dsn = ENV['SENTRY_KEY']
  
    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production.
    config.traces_sample_rate = 0.5
    # or
    config.traces_sampler = lambda do |context|
      true
    end
  end