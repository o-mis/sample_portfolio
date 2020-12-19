Rails.application.config.session_store :redis_store, {
  servers: [
    {
      host: 'ec-redis-0001-001.besjzl.0001.apne1.cache.amazonaws.com',
      port: 6379,
      db: 0,
      namespace: 'session' # 名前空間。"session:セッションID"の形式
    }
  ],
  expire_after: 90.minutes
}
