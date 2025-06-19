# Theme Preference Demo

[![English Docs](https://img.shields.io/badge/Docs-English-green?style=flat-square)](README.md)

## 项目概述
这是一个演示如何使用 Flutter 状态管理和本地存储实现主题切换的示例项目。

## 技术栈
- **ProxyProvider**：进行跨组件状态管理。
- **SharedPreferences**: 持久化用户主题偏好。

## 功能特性
- **区分不同用户的状态**：系统可通过唯一标识（用户 ID）关联不同用户与主题，以此区分不同用户的主题模式。
- **退出登录处理**：在退出登录操作时，系统会正确更新内存中的主题模式状态，确保不会出现退出登录后，仍保留原用户的主题，保证了用户数据的独立性与安全性。
- **持久化存储**：确保用户选择的主题模式在应用重启和重新登录后仍然保持。