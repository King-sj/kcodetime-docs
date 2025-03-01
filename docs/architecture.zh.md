---
date: 2025-01-20T00:00:00.000Z
---

# 架构设计

## 仓库划分

- [kcodetime-docs](https://github.com/King-sj/kcodetime-docs)：文档站。
- ​kcodetime-plugin-vscode：VS Code插件核心逻辑。
- ​kcodetime-server：后端服务（API + 数据处理）。
- ​kcodetime-web：前端管理面板。

- ​kcodetime-mobile​（可选）：未来移动端扩展。
- ​kcodetime-core​（未来考虑）：共享的通用代码库（如数据模型、工具类）。

## 数据库设计
详见 sql/ 目录
## kcodetime-server 详细设计

- [kcodetime-server 设计文档](kcodetime-server.zh.md)

## ​kcodetime-plugin-vscode 详细设计

- [kcodetime 设计文档](​kcodetime-plugin-vscode.zh.md)

## kcodetime-web 详细设计

- [kcodetime-web 设计文档](kcodetime-web.zh.md)
## 扩展性设计（未来考虑）

​插件抽象层：在 kcodetime-core 中定义 IDEPlugin 接口，便于支持 JetBrains 等。

​数据管道：用 RabbitMQ/Kafka 处理高吞吐事件（未来需要时）。

​动态配置：允许通过 Admin Web 调整统计指标。
## 参考资料

- [Java开发手册(黄山版).pdf](https://github.com/alibaba/p3c)
