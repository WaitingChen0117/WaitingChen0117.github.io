---
type: note
tags: [css, layout, 面试高频]
created: 2026-07-16
---

# Flex 布局

> [!info] 一句话概括
> 一维布局方案，通过主轴/交叉轴的对齐与伸缩，轻松实现居中、等分、自适应。

## 核心概念
- 容器 `display: flex`，子项成为 flex item
- **主轴**（main axis）由 `flex-direction` 决定；**交叉轴**（cross axis）与之垂直

## 容器属性
```css
.container {
  display: flex;
  flex-direction: row | column;        /* 主轴方向 */
  flex-wrap: nowrap | wrap;            /* 是否换行 */
  justify-content: center | space-between | ...; /* 主轴对齐 */
  align-items: center | stretch | ...;           /* 交叉轴对齐 */
  gap: 12px;                            /* 间距 */
}
```

## 子项属性
```css
.item {
  flex: 1;              /* flex-grow flex-shrink flex-basis 的简写 */
  align-self: center;   /* 覆盖单个项的交叉轴对齐 */
  order: 2;             /* 排序 */
}
```
- `flex: 1` = `1 1 0%`：等分剩余空间
- `flex: auto` = `1 1 auto`：按内容 + 剩余空间

## 常用场景
```css
/* 水平垂直居中 */
.center { display: flex; justify-content: center; align-items: center; }
```

## 易错点 / 面试追问
- `flex: 1` 会让 basis 变 0，多个子项等宽；`flex: auto` 会考虑内容宽度
- 主轴对齐用 `justify-content`，交叉轴用 `align-items`，别记反
- 一维用 Flex，二维用 [[02-Notes/CSS/Grid 布局]]

## 关联
- 上级主题：[[01-MOC/CSS-MOC|CSS MOC]]
- 相关笔记：[[02-Notes/CSS/Grid 布局]]

## 来源
- MDN / 阮一峰 Flex 教程
