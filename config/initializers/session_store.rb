Rails.application.config.session_store :redis_store, {
  servers: [
    {
      host: 'ec-redis.besjzl.clustercfg.apne1.cache.amazonaws.com',
      port: 6379,
      db: 0,
      namespace: 'session', # 名前空間。"session:セッションID"の形式
      timeout: 240
    }
  ],
  expire_after: 90.minutes
}
