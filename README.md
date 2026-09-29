# Roleplay Commands

Enhance your FiveM server with essential roleplay commands.

## Features

- Implements /do and /me commands for roleplay actions
- Includes a /try command for random success/failure outcomes
- Configurable cooldowns and permissions for each command
- Logs command usage to a database

## Requirements

- FiveM server
- ESX Framework
- MySQL database

## Installation

1. Download the script files
2. Place them in your server's resources folder
3. Add `start roleplaycommands` to your server.cfg
4. Run the database.sql file to create the necessary table

## Usage

### Commands

| Command | Description | Permission | Cooldown |
|---------|-------------|------------|----------|
| /do     | Perform a roleplay action | user | 5 seconds |
| /me     | Describe your own action | user | 5 seconds |
| /try    | Attempt an action with random success | user | 10 seconds |

### Configuration

Edit the config.lua file to enable/disable commands, set cooldowns, and adjust permissions.

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=roleplay-commands&utm_content=bottom) — describe it in one sentence and get the full source code.