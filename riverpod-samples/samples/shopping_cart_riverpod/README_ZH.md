# shoppping_cart_riverpod

[![English Docs](https://img.shields.io/badge/Docs-English-green?style=flat-square)](README.md)

## 项目概述
这是一个基于 Riverpod 状态管理库的购物车项目，通过 StateNotifierProvider 实现跨组件的状态共享和响应式更新，支持多用户购物车隔离与安全数据管理。

## 技术栈
- **StateNotifierProvider**：进行跨组件状态管理。
- **依赖注入(DI)**：通过 `ref.watch`/`ref.read` 自动获取用户和购物车状态。
- **StateNotifierProvider.family**：利用 `family` 动态生成隔离的购物车实例。

## 特性
- **多用户购物车隔离**：系统可通过唯一标识（用户 ID）关联不同用户与各自的购物车，以此区分不同用户的购物车。
- **响应变化**：通过 **ref.watch()** 监听购物车状态，状态变更时自动触发依赖组件重建。
- **退出登录处理**：在退出登录操作时，系统会正确更新内存中的购物车状态，确保不会出现退出登录后，购物车仍保留原用户数据的情况，保证了用户数据的独立性与安全性。