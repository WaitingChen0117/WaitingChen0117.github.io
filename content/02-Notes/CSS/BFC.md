---
type: note
tags: [css, layout, 面试高频]
created: 2026-07-16
---

# BFC（块级格式化上下文）

> [!info] 一句话概括
> BFC 是一块独立的渲染区域，内部布局不影响外部，可用来清除浮动、阻止 margin 合并。

## 是什么
Block Formatting Context：页面上一个独立的容器，内部元素的布局与外界隔离。

## 如何触发
- `overflow` 不为 `visible`（如 `hidden`/`auto`）
- `display: flow-root`（最干净、无副作用，推荐）
- `float` 不为 `none`
- `position: absolute / fixed`
- `display: inline-block / flex / grid / table-cell`

## 能解决什么
1. **清除浮动**：父元素触发 BFC，可以包含浮动子元素，避免高度塌陷
2. **阻止 margin 合并**：两个元素分处不同 BFC，上下 margin 不再合并
3. **自适应两栏布局**：给非浮动元素触发 BFC，使其不与浮动元素重叠

```css
.parent { display: flow-root; } /* 清浮动，无副作用 */
```

## 易错点 / 面试追问
- 为什么 `overflow: hidden` 能清浮动？因为它触发了 BFC，BFC 计算高度时会包含浮动元素
- `display: flow-root` 是专门为触发 BFC 设计的，优先用它

## 关联
- 上级主题：[[01-MOC/CSS-MOC|CSS MOC]]
- 相关笔记：[[02-Notes/CSS/盒模型]]、[[02-Notes/CSS/层叠上下文]]

## 来源
- MDN
