#!/bin/bash

# GitHub 部署脚本 - 夏慧明个人网站

echo "=== 夏慧明个人网站 - GitHub Pages 部署脚本 ==="
echo ""

# 配置变量（需要修改）
GITHUB_USERNAME="你的GitHub用户名"
REPO_NAME="huiming-website"
CUSTOM_DOMAIN="huimingxia.com"  # 如果有自定义域名，填在这里；如果没有，留空

# 进入网站目录
cd /root/.openclaw/workspace/huiming-website

# 检查是否已经初始化
if [ ! -d ".git" ]; then
    echo "📝 初始化 Git 仓库..."
    git init
    git branch -M main
else
    echo "✓ Git 仓库已存在"
fi

# 添加所有文件
echo "📦 添加文件到 Git..."
git add .

# 提交
echo "💾 提交更改..."
git commit -m "部署网站: $(date '+%Y-%m-%d %H:%M:%S')"

# 检查是否已有远程仓库
if git remote get-url origin &>/dev/null; then
    echo "✓ 远程仓库已存在"
else
    echo "🔗 添加远程仓库..."
    git remote add origin "https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"
fi

echo ""
echo "=== 准备推送到 GitHub ==="
echo "仓库地址: https://github.com/${GITHUB_USERNAME}/${REPO_NAME}"
echo ""

# 提示用户需要手动推送（需要 GitHub Token）
echo "⚠️  首次推送需要你的 GitHub 凭证"
echo ""
echo "请执行以下命令完成推送："
echo ""
echo "  git push -u origin main"
echo ""

# 如果有自定义域名
if [ ! -z "$CUSTOM_DOMAIN" ]; then
    echo ""
    echo "=== 自定义域名配置 ==="
    echo "1. 推送成功后，访问仓库：https://github.com/${GITHUB_USERNAME}/${REPO_NAME}/settings/pages"
    echo "2. 在 'Custom domain' 中填入: ${CUSTOM_DOMAIN}"
    echo "3. 在域名服务商（如阿里云、腾讯云）添加 DNS 记录："
    echo "   - 类型: CNAME"
    echo "   - 主机记录: @"
    echo "   - 记录值: ${GITHUB_USERNAME}.github.io"
    echo ""
    echo "4. 如果使用 www 前缀："
    echo "   - 类型: CNAME"
    echo "   - 主机记录: www"
    echo "   - 记录值: ${GITHUB_USERNAME}.github.io"
    echo ""
    echo "网站地址将是: https://${CUSTOM_DOMAIN}"
else
    echo ""
    echo "=== 网站地址 ==="
    echo "推送成功后，访问："
    echo "https://${GITHUB_USERNAME}.github.io/${REPO_NAME}/"
fi

echo ""
echo "✅ 脚本完成！"
