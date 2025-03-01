-- 存储积压在plugin端的code activity数据（离线、上传失败）
CREATE TABLE IF NOT EXISTS activity_logs (
  id TEXT PRIMARY KEY,        -- UUID 唯一标识
  data TEXT NOT NULL,         -- JSON 序列化后的数据
  status INTEGER DEFAULT 0,   -- 0:pending, 1:uploading
  retries INTEGER DEFAULT 0   -- 重试次数,
  last_retry_time INTEGER DEFAULT 0 -- 最后一次重试timestamp
);