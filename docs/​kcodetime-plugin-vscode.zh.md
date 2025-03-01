# vscode plugin 端设计方案

## 流程图

```mermaid
graph TD
  A[upload_code_activity] --> B{网络可用?}
  B -->|是| C[直接尝试上传]
  B -->|否| D[写入本地SQLite<br/>状态: pending]
  C --> E{上传成功?}
  E -->|是| F[删除本地数据]
  E -->|否| G[写入本地SQLite<br/>状态: pending]
  D --> H[定时检查网络]
  H --> I[批量获取pending数据<br/>状态: uploading]
  I --> J[分页上传到服务器]
  J --> K{上传成功?}
  K -->|是| L[删除本地数据]
  K -->|否| M[更新retries+1<br/>状态: pending]
```

### 优化

先用轮询器/监听器统计代码活动数据修改程序**内部变量**，再用轮询器fetch/change变量来 **upload_code_activity**

### 重试策略：

指数退避重试：retryDelay = Math.min(2^retries * 1000, 30000)

最大重试次数：建议 5 次后标记为失败,并通知用户

## 存储方案

使用 SQLite 数据库（基于 better-sqlite3 或 sql.js）：

## 数据清理策略

|数据状态|保留策略|
|--|--|
|uploaded|立即删除|
|failed (retries≥5)|保留 7 天后删除|
|pending|持续重试|

## 数据上报优化策略

压缩传输：使用 gzip 压缩 JSON 数据

批量上传：每批 50-100 条记录
