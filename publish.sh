#!/usr/bin/env bash
# 发布脚本：把 Obsidian Vault 的内容同步进本仓库并推送，触发 GitHub Pages 自动构建。
# 用法： ./publish.sh "可选的提交信息"
set -euo pipefail

VAULT="/Users/lingcheng/Documents/Obsidian Vault"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
MSG="${1:-update notes $(date '+%Y-%m-%d %H:%M')}"

echo "→ 同步笔记：$VAULT  ->  $REPO_DIR/content"
rsync -a --delete \
  --exclude '.obsidian' \
  --exclude '.git' \
  --exclude '.comate' \
  "$VAULT/" "$REPO_DIR/content/"

cd "$REPO_DIR"
git add -A
if git diff --cached --quiet; then
  echo "→ 没有变更，无需发布。"
  exit 0
fi
git commit -m "$MSG"
git push
echo "✓ 已推送。GitHub Actions 正在构建，稍后访问： https://waitingchen-wiki.tech/"
