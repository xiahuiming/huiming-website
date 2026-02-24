# 夏慧明个人网站

## 网站结构

```
huiming-website/
├── index.html          # 首页（个人简介）
├── resume.html         # 详细简历
├── blog/               # 慧明杂谈文章
│   ├── index.html      # 文章列表
│   └── article-001.html # 第一篇文章
├── css/
│   └── style.css       # 商务科技风格样式
└── README.md           # 本文件
```

## 如何查看网站

### 方法一：直接打开文件
用浏览器打开 `index.html` 文件即可查看

### 方法二：启动本地服务器
```bash
# 进入网站目录
cd /root/.openclaw/workspace/huiming-website

# 启动 Python HTTP 服务器
python3 -m http.server 8000
```

然后在浏览器访问：`http://localhost:8000`

## 如何添加新文章

### 简单方法：复制现有文章
1. 复制 `blog/article-001.html`
2. 重命名为 `blog/article-002.html`
3. 编辑文件内容（标题、日期、正文）
4. 在 `blog/index.html` 中添加新文章的链接

### 添加文章步骤（示例）

**步骤1：创建新文章**
```bash
cp blog/article-001.html blog/article-002.html
```

**步骤2：编辑新文章**
打开 `blog/article-002.html`，修改：
- `<title>` 标签中的标题
- `<h1>` 文章标题
- 发布日期
- 文章内容

**步骤3：在文章列表中添加**
打开 `blog/index.html`，在 `<div class="article-list">` 中添加：

```html
<div class="article-item" onclick="window.location.href='article-002.html'">
    <h3>你的文章标题</h3>
    <p class="meta">2026年2月24日 | 分类</p>
    <p class="excerpt">文章摘要...</p>
    <div class="tags">
        <span class="tag">标签1</span>
        <span class="tag">标签2</span>
    </div>
</div>
```

## 部署网站

### 方案一：GitHub Pages（推荐）

**优点：**
- 免费
- 自动HTTPS
- 支持自定义域名
- 使用git管理，有版本控制

**步骤：**

1. **创建 GitHub 仓库**
   - 登录 GitHub
   - 创建新仓库，命名为 `huiming-website`
   - 选择 Public 或 Private

2. **上传文件到 GitHub**
   ```bash
   cd /root/.openclaw/workspace/huiming-website
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/你的用户名/huiming-website.git
   git push -u origin main
   ```

3. **启用 GitHub Pages**
   - 进入仓库 Settings
   - 找到 Pages
   - Source 选择 `Deploy from a branch`
   - Branch 选择 `main`，目录选 `/(root)`
   - 保存

4. **访问网站**
   - 等待几分钟
   - 访问 `https://你的用户名.github.io/huiming-website/`

### 方案二：Netlify（更简单）

**步骤：**

1. **将网站推送到 GitHub**（同上）

2. **连接 Netlify**
   - 访问 https://netlify.com
   - 登录并导入 GitHub 仓库
   - 选择 `huiming-website` 仓库
   - 自动部署

### 方案三：自己服务器

**步骤：**

1. **上传文件到服务器**
   ```bash
   scp -r huiming-website/* user@your-server.com:/var/www/html/
   ```

2. **配置 Web 服务器**
   - Nginx 或 Apache 配置指向 `/var/www/html/`

## 自定义域名（可选）

如果你有自己的域名（如 `huimingxia.com`）：

### GitHub Pages
1. 在仓库 Settings → Pages 中设置 Custom domain
2. 在域名服务商处添加 CNAME 记录：
   - 主机记录：`www`（或 `@`）
   - 记录值：`你的用户名.github.io`

### Netlify
1. 在 Site settings → Domain management 中添加域名
2. 按照提示配置 DNS

## 更新个人资料

### 修改联系方式
打开 `index.html` 和 `resume.html`，找到 "联系方式" 部分，修改邮箱、微信等。

### 添加社交链接
在导航栏或联系区域添加 LinkedIn、微信公众号等链接。

## 样式自定义

如果需要修改颜色、字体等，编辑 `css/style.css`：

```css
:root {
    --primary-color: #1a3a5a;    /* 主色调 */
    --secondary-color: #2c5282;  /* 次要色调 */
    --accent-color: #3182ce;     /* 强调色 */
}
```

## 备份和版本控制

建议使用 git 进行版本控制：

```bash
# 初始化
git init
git add .
git commit -m "初始版本"

# 添加远程仓库
git remote add origin https://github.com/你的用户名/huiming-website.git

# 推送
git push -u origin main

# 后续更新
git add .
git commit -m "添加新文章"
git push
```

## 常见问题

### Q: 文章图片怎么处理？
A: 创建 `images/` 目录，将图片放进去，然后在文章中引用：
```html
<img src="../images/你的图片.jpg" alt="图片说明">
```

### Q: 如何修改网站标题？
A: 修改每个 HTML 文件中 `<title>` 标签的内容。

### Q: 如何修改导航栏？
A: 修改每个 HTML 文件中 `<`header>` 部分的 `<ul>` 列表。

### Q: 如何添加新的页面？
A: 创建新的 `.html` 文件，复制 `index.html` 的结构，修改内容，然后在导航栏添加链接。

---

**网站已准备就绪！如需帮助，请联系。**
