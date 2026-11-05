# nvim-lab 配置维护说明

## 项目目标

这是一个从零构建的 Neovim 配置项目，目标是形成一套属于自己的、可理解和可维护的 IDE 配置。

## 配置来源

- 主要配置源文件是 `context-org/nvim-init.org`。
- 使用 Org Babel tangle 将 Org source block 生成 Lua 配置文件。
- 优先修改 Org 文件，不要直接编辑由 tangle 生成的 Lua 文件。
- Codex 修改配置时只修改 Org 源文件，不执行 tangle，也不主动生成或更新 Lua 文件；由用户自行执行 tangle 并确认结果。
- 检查配置时以 `nvim-init.org` 中的 Org Babel Lua 代码块为准，重点检查 Lua 语法、Neovim API 用法和配置逻辑。
- 每次变更都必须记录到 `readme.org` 的“变更记录”中。

## 过渡阶段启动方式

使用独立的 `NVIM_APPNAME`，避免与本机默认 Neovim 配置冲突：

```sh
NVIM_APPNAME=nvim-lab nvim
```

配置目录是 `/home/valjean/.config/nvim-lab`。

## 修改规则

1. 新增插件时记录用途、懒加载条件、配置位置和外部依赖。
2. 配置保持模块化；复杂内容拆分为独立 Org source block，并明确 `:tangle` 目标。
3. 不修改或覆盖默认 `/home/valjean/.config/nvim` 配置。
4. 不删除已有配置，除非用户明确要求并在 `readme.org` 中记录原因。
5. 不删除、改名或重组用户已经添加的 Org subtree、代码块或说明内容；如需调整位置或内容，必须先得到用户明确要求。
6. 生成文件由用户在确认 Org 源文件后自行 tangle；Codex 不直接修改生成的 Lua 文件，也不替用户执行 tangle。
7. 用户负责执行 tangle，并负责对生成的 Lua 配置进行最终启动验证。

## 开发环境

- 项目使用 `devenv.nix` 管理开发环境。
- Lua 支持通过 `devops/basic/default.nix` 中的 `languages.lua.enable` 提供，并包含 Lua Language Server。
- Lua 代码由项目现有的 Treefmt 集成调用 StyLua 格式化；配置位于同一文件的 `treefmt.config.programs.stylua`。
- Nix 代码由 Alejandra 格式化，范围明确限定为 `devenv.nix` 和 `devops/**/*.nix`。
- nvim-treesitter 的 parser 编译依赖由 devenv 提供，包括 `tree-sitter` CLI、C 编译器、curl 和 tar。
- Codex 不执行 `devenv` 更新、tangle 或格式化命令；由用户在确认配置后执行。

## 校验

修改后至少执行：

```sh
NVIM_APPNAME=nvim-lab nvim --headless "+qa"
```

如果增加插件、LSP 或格式化工具，还应补充对应的最小启动或功能检查，并把结果记录到 `readme.org`。
