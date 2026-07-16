---
type: note
tags: [javascript, 模块化, 面试高频]
created: 2026-07-16
---

# 模块化 ESM 与 CJS

> [!info] 一句话概括
> CommonJS 运行时同步加载、值拷贝；ES Module 编译时静态分析、引用绑定，支持 Tree-shaking。

## CommonJS (CJS)
Node 传统方案。
- `require()` 导入、`module.exports` / `exports` 导出
- **运行时**加载，同步执行
- 导出的是值的**拷贝**（导出后原模块内变化不影响已导入的值）

```js
const fs = require('fs');
module.exports = { foo };
```

## ES Module (ESM)
语言标准，浏览器与现代 Node 通用。
- `import` / `export`
- **编译时**静态分析（import 必须在顶层，不能动态拼路径 → 除非用 `import()`）
- 导出的是**引用绑定**（live binding），原模块变化会反映到导入方
- 支持 **Tree-shaking**（打包时移除未用代码）

```js
import { foo } from './foo.js';
export const bar = 1;
export default function () {}
```

## 关键区别
- **加载时机**：CJS 运行时 / ESM 编译时
- **导出值**：CJS 拷贝 / ESM 引用
- **加载方式**：CJS 同步 / ESM 异步（可静态优化）
- **this**：CJS 顶层 this 是 module.exports / ESM 是 undefined
- **Tree-shaking**：仅 ESM 支持

## 易错点 / 面试追问
- Node 中用 `.mjs` 或 `package.json` 设 `"type": "module"` 启用 ESM
- 动态导入 `import()` 返回 Promise，可按需/懒加载
- 循环依赖：CJS 可能拿到未完成的 exports，ESM 靠 live binding 相对更好处理

## 关联
- 上级主题：[[01-MOC/JavaScript-MOC|JavaScript MOC]]
- 相关笔记：[[02-Notes/Engineering/Webpack 原理]]

## 来源
- MDN / Node 文档
