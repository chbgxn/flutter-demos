## Project Overview  

[![中文文档](https://img.shields.io/badge/文档-中文-blue?style=flat-square)](README_ZH.md)

This is a simple shopping cart project based on the Flutter framework, utilizing ProxyProvider for state management.  

### Tech Stack  
- **Flutter**: Used to build cross-platform mobile application interfaces.  
- **ProxyProvider**: Responsible for efficient state management in the project.  

### Core Objective  
The project aims to demonstrate how to skillfully leverage ProxyProvider to implement shopping cart state management, providing developers with practical reference material.  

### Key Features  
- **User Login & Cart Separation**: Supports logging in as "Mike" or "Alice." The system associates different users with their respective carts via a unique identifier (user ID). When switching between user accounts, items can be added to the corresponding cart, ensuring distinct cart contents for different users.  
- **Logout Handling**: Upon logout, the system correctly updates the in-memory cart state, preventing retained cart data from the previous user. This ensures data independence and security.