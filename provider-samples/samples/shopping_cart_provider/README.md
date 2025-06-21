# shoppping_cart_provider

[![中文文档](https://img.shields.io/badge/文档-中文-blue?style=flat-square)](README_ZH.md)

## Project Overview  
This is a simple shopping cart project that uses ProxyProvider for state management.

## Tech Stack  
- **ProxyProvider**: For cross-component state management.  

## Features  
- **Distinguishing the status of different users**: The system can associate different users with their respective shopping carts through a unique identifier (user ID), thereby distinguishing the shopping carts of different users.
- **Response to Changes**: When a user performs the add to cart operation, the Provider will listen for state changes and automatically notify the components that depend on that state to rebuild, thereby updating the interface display.
- **Logout Handling**: Upon logout, the system correctly updates the in-memory cart state, preventing retained cart data from the previous user. This ensures data independence and security.

## Expansion
- **Q**: Why is the data missing?  
**A**: The data in memory is cleared due to a state reset or a reinitialization of the Provider tree caused by logging out. Specifically, when the user logs out (userId is null), the update function returns an empty Cart instance.
- **Q**: Can we rely on previous to solve this problem?  
**A**: Taking Jack's shopping cart as an example, when logging back in as Jack, previous points to an empty Cart instance instead of Jack's previous shopping cart. Therefore, relying on previous would also lead to data loss because it does not preserve Jack's cart state. Since the outcome is the same, this project does not rely on previous.
- To solve the data loss problem, persistent storage is the key, and it's recommended to use `SharedPreferences` or `Hive`.