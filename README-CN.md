 # OceanBase Desktop

一个用于安装和管理 OceanBase Desktop 的 Homebrew cask - 一个强大的 OceanBase 数据库管理 GUI 工具。

## 描述

OceanBase Desktop 是一个全面的图形用户界面工具，旨在简化 OceanBase 数据库的安装、配置和管理。这个 Homebrew cask 提供了一种在 macOS 系统上安装 OceanBase Desktop 的简便方法。

## 特性

- **简易安装**：通过 Homebrew 一键安装
- **数据库管理**：直观的 OceanBase 数据库操作 GUI
- **跨平台**：针对 macOS 优化，支持 ARM64 架构
- **集成**：与 OrbStack 无缝集成，用于虚拟机管理

## 系统要求

- macOS（ARM64 架构）
- [Homebrew](https://brew.sh/) 包管理器
- [OrbStack](https://orbstack.dev/)（作为依赖项自动安装）

## 安装

### 前置条件

1. 安装 Homebrew（如果尚未安装）：
   ```bash
   /bin/bash -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
   ```

2. 将此 tap 添加到您的 Homebrew 安装中：
   ```bash
   brew tap oceanbase/homebrew-oceanbase-desktop
   ```

### 安装 OceanBase Desktop

```bash
brew install --cask oceanbase-desktop
```

安装过程将自动：
- 下载最新版本的 OceanBase Desktop
- 安装 OrbStack 作为依赖项（如果尚未安装）
- 将应用程序放置在您的应用程序文件夹中

## 使用方法

安装后，您可以：

1. **启动应用程序**：在应用程序文件夹中找到"OceanBase Desktop"或使用 Spotlight 搜索
2. **首次运行**：应用程序将引导您完成初始设置
3. **数据库操作**：使用 GUI 管理您的 OceanBase 数据库

## 应用程序信息

- **当前版本**：1.0.0
- **架构**：ARM64（Apple Silicon）
- **安装指南**：[如何安装 OceanBase Desktop](https://www.oceanbase.com/docs/common-oceanbase-database-cn-1000000002866370)
- **开源**：[开源网站](https://open.oceanbase.com/)

## 卸载

要移除 OceanBase Desktop：

```bash
brew uninstall --cask oceanbase-desktop
```

这将同时清理：
- 应用程序文件
- 应用程序支持数据
- 保存的应用程序状态
- 应用程序虚拟机

## 许可证

本项目采用 Apache License 2.0 许可证。详情请参阅 [LICENSE](LICENSE) 文件。