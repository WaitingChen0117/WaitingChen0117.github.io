---
type: note
tags: [css, 面试高频]
created: 2026-07-16
---

# CSS 变量（自定义属性）

> [!info] 一句话概括
> 用 `--name` 定义、`var()` 使用的原生变量，可继承、可被 JS 读写，是做主题切换的利器。

## 基本用法
```css
:root {
  --primary: #284b63;
  --gap: 16px;
}
.button {
  background: var(--primary);
  padding: var(--gap);
  color: var(--text, #333); /* 第二个参数是回退值 */
}
```

## 特点
- **可继承**：子元素继承父元素定义的变量
- **作用域**：在哪个选择器定义，就在该元素及后代内生效
- **运行时动态**：不同于 Sass 变量（编译时），CSS 变量在浏览器运行时求值，可被媒体查询/JS 改变

## 配合 JS
```js
document.documentElement.style.setProperty('--primary', '#f00');
getComputedStyle(el).getPropertyValue('--primary');
```

## 典型场景：暗色主题切换
```css
:root        { --bg: #fff; --fg: #000; }
[data-theme="dark"] { --bg: #161618; --fg: #ebebec; }
body { background: var(--bg); color: var(--fg); }
```
切换只需改根元素的 `data-theme` 属性。

## 易错点 / 面试追问
- CSS 变量 vs Sass 变量：前者运行时、能被 JS 改；后者编译时、静态
- `var()` 可嵌套、可设回退值
- 变量值是字符串，`calc(var(--gap) * 2)` 可参与计算

## 关联
- 上级主题：[[01-MOC/CSS-MOC|CSS MOC]]

## 来源
- MDN
