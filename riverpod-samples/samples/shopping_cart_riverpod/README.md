# shoppping_cart_riverpod

[![中文文档](https://img.shields.io/badge/文档-中文-blue?style=flat-square)](README_ZH.md)

## Project Overview  
This is a shopping cart demo based on the `Riverpod` state management library, which implements cross-component state sharing and reactive updates through `StateNotifierProvider`, supporting multi-user cart isolation and secure data management.

## Tech Stack  
- **ProxyProvider**: For cross-component state management.  
- **Dependency Injection(DI)**: Automatically fetch user and cart status via `ref.watch`/`ref.read`.
- **StateNotifierProvider.family**: Leverage `family` to dynamically generate isolated cart instances.

## Features  
- **Multi-user shopping cart isolation**: The system can associate different users with their respective shopping carts through a unique identifier (user ID), thus distinguishing between different users’ shopping carts.
- **Response changes**: By using **ref.watch()**, the system monitors the shopping cart status and automatically triggers the rebuilding of dependent components when the status changes.
- **Logout handling**: When a user logs out, the system correctly updates the shopping cart status in memory, ensuring that the original user's data does not remain in the shopping cart after logout, thus guaranteeing the independence and security of user data.