# Provider Samples  

[![English Docs](https://img.shields.io/badge/Docs-English-green?style=flat-square)](README.md)

本项目提供了一些使用 **Provider** 状态管理库的 Flutter 示例。  

## 包含的示例  

1. **Counter**  
   - 基础 `Provider` 使用示例  
   - 演示如何管理简单的计数器状态  

2. **Shopping Cart**  
   - 使用 `ProxyProvider` 实现多用户独立购物车  
   - 支持用户登录、商品添加和退出登录

3. **theme preferences**  
   - 使用 `ProxyProvider` 实现多用户独立主题  
   - 支持用户登录、主题模式切换和退出登录
   - 使用 `shared_preferences` 实现持久化存储

## 依赖说明  
所有示例均基于：  
- `provider`
- 其他必要依赖(详见各个项目文件夹的 pubspec.yaml)