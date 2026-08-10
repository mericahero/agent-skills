#!/bin/bash
# publish.sh — 一键推送 agent-skills 到 GitHub
# 用法: 在本地下载 zip 解压后，进入目录运行 bash publish.sh
#
# 前提:
#   1. 已配置 GitHub SSH key
#   2. 已安装 git
#   3. GitHub 上还没有同名仓库（脚本会自动创建）

set -e

REPO_NAME="agent-skills"
GITHUB_USER="mericahero"

echo "=== 检查环境 ==="
git --version || { echo "错误: 未安装 git"; exit 1; }
ssh -T git@github.com 2>&1 || true

echo ""
echo "=== 检查远程仓库是否已存在 ==="
if git remote get-url origin 2>/dev/null; then
    echo "远程仓库已配置，跳过添加"
else
    echo "添加远程仓库..."
    git remote add origin "git@github.com:$GITHUB_USER/$REPO_NAME.git"
fi

echo ""
echo "=== 推送到 GitHub ==="
echo "注意: 请确保你已在 GitHub 上创建空仓库: https://github.com/new"
echo "仓库名: $REPO_NAME"
echo "不要勾选 README/LICENSE/.gitignore（已有）"
echo ""
read -p "已创建好空仓库？按回车继续推送，Ctrl+C 取消..."
git push -u origin main

echo ""
echo "=== 推送完成 ==="
echo "仓库地址: https://github.com/$GITHUB_USER/$REPO_NAME"
echo ""
echo "后续更新:"
echo "  1. 修改文件后: git add -A && git commit -m '描述'"
echo "  2. 打标签: git tag v1.1.0 && git push --tags"
echo "  3. 更新 CHANGELOG.md 记录变更"
