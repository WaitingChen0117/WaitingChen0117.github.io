---
type: note
tags: [javascript, async, 面试高频]
created: 2026-07-16
---

# 事件循环 Event Loop

> [!info] 一句话概括
> JS 单线程通过事件循环调度同步任务、微任务、宏任务，实现非阻塞异步。

## 是什么
JS 主线程执行同步代码；异步回调进入任务队列，主线程空闲时按规则取出执行。这个"取任务—执行—再取"的循环就是事件循环。

## 原理
1. 执行同步代码（调用栈）
2. 清空**微任务队列**（Promise.then、queueMicrotask、MutationObserver）
3. 取**一个宏任务**（setTimeout、setInterval、I/O、UI 事件）执行
4. 每个宏任务后再次清空微任务队列
5. 循环

```js
console.log(1);
setTimeout(() => console.log(2));      // 宏任务
Promise.resolve().then(() => console.log(3)); // 微任务
console.log(4);
// 输出：1 4 3 2
```

## 易错点 / 面试追问
- 微任务优先级高于宏任务，且每轮宏任务后清空所有微任务
- `await` 后面的代码等价于 `.then` 里的微任务
- Node 与浏览器的事件循环有差异（Node 有 phases、`process.nextTick`）

## 关联
- 上级主题：[[01-MOC/JavaScript-MOC|JavaScript MOC]]
- 相关笔记：[[02-Notes/JavaScript/Promise 原理]]、[[02-Notes/JavaScript/async-await]]

## 来源
- MDN / 你的实践总结
