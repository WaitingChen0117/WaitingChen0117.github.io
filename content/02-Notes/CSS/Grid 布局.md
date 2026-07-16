---
type: note
tags: [css, layout, 面试高频]
created: 2026-07-16
---

# Grid 布局

> [!info] 一句话概括
> 二维布局方案，同时控制行和列，适合整体页面结构和复杂网格。

## 核心概念
- 容器 `display: grid`
- 用 `grid-template-columns / rows` 定义轨道，子项放入网格单元

## 容器属性
```css
.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);   /* 三等分列 */
  grid-template-rows: 100px auto;
  gap: 16px;                                /* 行列间距 */
  grid-template-areas:
    "header header"
    "sidebar main";
}
```
- `fr`：剩余空间的比例单位
- `repeat()`、`minmax()`、`auto-fill`/`auto-fit` 组合可做响应式

## 子项定位
```css
.item {
  grid-column: 1 / 3;        /* 跨列 */
  grid-row: span 2;          /* 跨 2 行 */
  grid-area: header;         /* 放入命名区域 */
}
```

## 响应式经典写法
```css
/* 自动填充，卡片列表自适应 */
grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
```

## 易错点 / 面试追问
- **Flex vs Grid**：Flex 一维（沿一个方向排），Grid 二维（行列同时控制）。整体布局用 Grid，局部排列用 Flex
- `auto-fill` 会保留空轨道，`auto-fit` 会折叠空轨道让内容撑满
- `fr` 是分配剩余空间，会先扣除固定尺寸和 gap

## 关联
- 上级主题：[[01-MOC/CSS-MOC|CSS MOC]]
- 相关笔记：[[02-Notes/CSS/Flex 布局]]、[[02-Notes/CSS/响应式与单位]]

## 来源
- MDN
