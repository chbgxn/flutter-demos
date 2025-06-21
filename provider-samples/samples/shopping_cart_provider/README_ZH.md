# shoppping_cart_provider

[![English Docs](https://img.shields.io/badge/Docs-English-green?style=flat-square)](README.md)

## 项目概述
这是一个运用 ProxyProvider 进行状态管理的简单购物车项目。

## 技术栈
- **ProxyProvider**：进行跨组件状态管理。

## 特性
- **区分不同用户的状态**：系统可通过唯一标识（用户 ID）关联不同用户与各自的购物车，以此区分不同用户的购物车。
- **响应变化**：当用户执行加入购物车操作时，Provider 会监听到状态变化，并自动通知依赖该状态的组件重建，从而更新界面显示。
- **退出登录处理**：在退出登录操作时，系统会正确更新内存中的购物车状态，确保不会出现退出登录后，购物车仍保留原用户数据的情况，保证了用户数据的独立性与安全性。

## 拓展
- **Q**: 为什么数据丢失了？  
**A**: 由于退出登录导致状态重置或 Provider 树重建，内存中的数据被清空。具体表现为当用户退出登录（userId 为 null）时，update 函数返回一个空的 Cart 实例。  
- **Q**: 那可以依赖 previous 解决这个问题吗？  
**A**: 以Jack的购物车为例，再次登录为 Jack 时，previous 指向的是空的 Cart 实例，而不是 Jack 之前的购物车。因此，依赖 previous 也会导致数据丢失，因为它没有保存 Jack 的购物车状态。由于是一样的结果，所以本项目没有依赖 previous。
- 为了解决数据丢失的问题，持久化存储是关键，推荐使用 `SharedPreferences` 或者 `Hive`。