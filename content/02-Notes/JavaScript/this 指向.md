---
type: note
tags: [javascript, this, 面试高频]
created: 2026-07-16
---

# this 指向

> [!info] 一句话概括
> this 在**函数被调用时**确定，取决于调用方式；箭头函数例外，它继承定义时的 this。

## 判定规则（优先级从高到低）
1. **new 绑定**：`new Fn()`，this 指向新创建的实例
2. **显式绑定**：`call` / `apply` / `bind`，this 指向传入的对象
3. **隐式绑定**：`obj.fn()`，this 指向调用者 `obj`
4. **默认绑定**：直接调用 `fn()`，非严格模式指向 `window`，严格模式为 `undefined`

```js
const obj = {
  name: 'a',
  fn() { return this.name; }
};
obj.fn();              // 'a'（隐式）
const f = obj.fn;
f();                   // undefined / 报错（默认）
obj.fn.call({name:'b'}); // 'b'（显式）
```

## 箭头函数
没有自己的 this，捕获**定义时**外层的 this，且无法被 call/apply/bind 改变。

```js
const obj = {
  name: 'a',
  fn() {
    return [1].map(() => this.name); // 箭头继承 fn 的 this -> 'a'
  }
};
```

## 易错点 / 面试追问
- 回调/setTimeout 里的普通函数 this 常丢失 → 用箭头函数或 bind 修复
- DOM 事件处理函数中普通函数的 this 指向绑定元素
- `call/apply` 区别：apply 第二个参数是数组

## 关联
- 上级主题：[[01-MOC/JavaScript-MOC|JavaScript MOC]]
- 相关笔记：[[02-Notes/JavaScript/原型与原型链]]

## 来源
- MDN
