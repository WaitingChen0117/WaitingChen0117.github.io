---
type: note
tags: [javascript, async, 面试高频]
created: 2026-07-16
---

# async / await

> [!info] 一句话概括
> async/await 是 Promise 的语法糖，用同步写法处理异步，await 会暂停函数直到 Promise resolve。

## 是什么
- `async` 函数总是返回 Promise
- `await` 后接 Promise，会"等待"其结果，期间让出线程
- `await` 之后的代码相当于 `.then` 里的微任务

```js
async function getData() {
  try {
    const a = await fetch('/a').then(r => r.json());
    const b = await fetch('/b').then(r => r.json());
    return { a, b };
  } catch (e) {
    console.error(e); // 用 try/catch 捕获 reject
  }
}
```

## 并发优化
串行 await 会浪费时间，无依赖的请求应并发：

```js
// 慢：串行
const a = await fetchA();
const b = await fetchB();

// 快：并发
const [a, b] = await Promise.all([fetchA(), fetchB()]);
```

## 易错点 / 面试追问
- `forEach` 里用 await 不会等待，用 `for...of` 或 `Promise.all`
- 错误处理：try/catch，或对 await 的 promise 加 `.catch`
- await 会阻塞后续代码，但不阻塞主线程（异步让出）

## 关联
- 上级主题：[[01-MOC/JavaScript-MOC|JavaScript MOC]]
- 相关笔记：[[02-Notes/JavaScript/Promise 原理]]、[[02-Notes/JavaScript/事件循环 Event Loop]]

## 来源
- MDN
