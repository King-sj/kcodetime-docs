# kcodetime-docs

- [中文](README.zh.md)
- [english](README.md)

kcodetime 是用于统计用户编码状态的vscode插件（主要用于统计编码时间）。

此项目用于同步项目的整体架构设计文档，API 等。
## 统计信息

- 编程语言：
  - start timestamp & end timestamp
  - 字符修改次数 （增删改）
  - name
- 项目
  - start timestamp & end timestamp
  - name
  - branch (若有git)
- 编辑器事件
  - 调试 : start timestamp & end timestamp
  - 终端 : start timestamp & end timestamp
- 操作系统 :
  - start timestamp & end timestamp
  - name
- IDE 信息：
  - start timestamp & end timestamp
  - Visual Studio Code 的版本及插件版本

详情如下:
```json
{
  "id" : "uuid",
  "start_time_stamp": "int",
  "end_time_stamp": "int",
  "languages" :[
    {
      "name": "string",
      "characters_added ": "int",
      "characters_deleted ": "int",
      "duration": "seconds"
    }
  ],
  "project":{
    "name":"string",
    "branch":"string"
  },
  "debug":{
    "duration": "seconds"
  },
  "terminal":{
    "duration": "seconds"
  },
  "os":{
    "name": "string",
    "version": "string"
  },
  "ide":{
    "name": "string",
    "version": "string"
  },
  "version":"string"
}
```
## 开发环境

- Visual Studio Code 1.96.4
- Python 3.13
- Vue 3 (typescript)
- redis
- postgreSQL
- docker

## 架构设计

详见文档

[架构设计](docs/architecture.zh.md)