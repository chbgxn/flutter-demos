# pagination_loading_demo

[![English Docs](https://img.shields.io/badge/Docs-English-green?style=flat-square)](README.md)

- 本项目采用 `Riverpod` 状态管理库实现响应式分层架构。通过 Provider 依赖注入将 `Dio` 客户端单例化，隔离网络请求逻辑。前端通过 `AsyncNotifierProvider` 派生状态控制器，统一管理分页数据的加载、错误处理和状态同步，结合 `ListView.builder` 实现无限滚动。

- 后端数据源基于 **JSONPlaceholder** 的公开模拟 API（`/posts` 端点），通过 `Dio` 客户端发送分页请求得到 JSON 数据。

## 特性 
- **反序列化**: 将服务器返回的 JSON 数据通过 `json_serializable` 生成的 `fromJson()` 方法反序列化为 Dart 的 `Post` 对象
- **数据展示**: `ListView.builder` 实现按需加载
- **错误处理**: 使用 `OverLay` 实现 toast 提醒
- **加载**: 使用 `Shimmer`(骨架屏) 作为过渡动画
- **刷新**: 支持刷新重新获取数据

## 说明
- 具体依赖(详见 pubspec.yaml)