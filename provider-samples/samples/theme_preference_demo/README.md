# Theme Preference Demo

[![中文文档](https://img.shields.io/badge/文档-中文-blue?style=flat-square)](README_ZH.md)

## Project Overview
This is a demonstration project showcasing how to implement theme switching in Flutter using state management and local storage.

## Tech Stack
- **ProxyProvider**: For cross-component state management.  
- **SharedPreferences**: Persisting user theme preferences.

## Key Features
- **Distinguish the state of different users**: The system associates different theme modes with unique user IDs, maintaining separate preferences for each user.  
- **Logout handling**: Properly clears theme states from memory during logout to prevent theme retention across user sessions. 
- **Persistent storage**: Maintains user-selected theme modes across app restarts and login sessions.
