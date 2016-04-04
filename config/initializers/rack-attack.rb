class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  Rack::Attack.blacklist('multiple user name req') do |req|
    Rack::Attack::Allow2Ban.filter(req.ip, maxretry: 30, findtime: 1.minute, bantime: 24.hour) do
      # The count for the IP is incremented if the return value is truthy.
      '/members/name'.in?(req.path) && req.ip
    end
  end

  Rack::Attack.throttle 'logins/ip', limit: 2, period: 1 do |req|
    req.post? && req.path == '/login' && req.ip
  end
end
