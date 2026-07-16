---
type: note
tags: [javascript, async, 面试高频]
created: 2026-07-16
---

# Promise 原理

> [!info] 一句话概括
> Promise 是异步的状态机：pending → fulfilled/rejected，状态一旦改变不可逆，用 then/catch 注册回调。

## 三种状态
- `pending`（进行中）→ `fulfilled`（成功）或 `rejected`（失败）
- 状态只能改变一次，且不可逆

## 核心方法
- `then(onFulfilled, onRejected)`：返回**新 Promise**，支持链式调用
- `catch`：等价 `then(null, onRejected)`
- `finally`：无论成败都执行

```js
new Promise((resolve, reject) => {
  setTimeout(() => resolve(1), 100);
})
  .then(v => v + 1)   // 链式：返回值传给下一个 then
  .then(v => console.log(v)); // 2
```

## 静态方法
- `Promise.all([...])`：全部成功才成功，有一个失败即失败
- `Promise.allSettled`：等待全部结束，返回每个结果状态
- `Promise.race`：第一个改变状态的决定结果
- `Promise.any`：第一个成功的决定结果

## 易错点 / 面试追问
- `.then` 的回调是**微任务**，见 [[02-Notes/JavaScript/事件循环 Event Loop]]
- 链式中 return 普通值 vs return Promise 的区别（后者会等待其 resolve）
- 手写 Promise 是高频题：需实现状态管理、then 链、值穿透

## 关联
- 上级主题：[[01-MOC/JavaScript-MOC|JavaScript MOC]]
- 相关笔记：[[02-Notes/JavaScript/async-await]]、[[02-Notes/JavaScript/事件循环 Event Loop]]

## 来源
- MDN
