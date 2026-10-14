# 🚀 Michael Angelo "Meeko" Sapnit — AI Works Portfolio (Web Showcase)

> **Lead AI Engineer & Autonomous Solutions Architect**  
> Public interactive showcase featuring 15+ production-grade AI systems across Autonomous Multi-Agent Workflows, Generative Media Pipelines, Enterprise RAG, Computer Vision, and Quantitative Machine Learning.

---

## 🌐 Public Hosting via GitHub Pages (30-Second Setup)

This web portfolio is engineered as a clean, high-performance static web application (`index.html`) with **zero build dependencies**, 100% offline fallback, and full responsiveness.

### Method A: 1-Click Automated Script (Easiest)
1. Double-click **`deploy_github_pages.bat`** (or run `powershell ./deploy_github_pages.ps1`).
2. When prompted, paste your new GitHub repository URL (e.g. `https://github.com/<your-username>/ai-portfolio.git`).
3. The script will automatically initialize Git, stage all files, commit, and push to `main`.

---

### Method B: Manual Git Commands
From this directory (`C:\Users\Meeko\ai-portfolio`):

```bash
# 1. Initialize local repo
git init
git branch -M main

# 2. Stage and commit files
git add .
git commit -m "Deploy AI Portfolio showcase to GitHub Pages"

# 3. Connect to your GitHub repository
git remote add origin https://github.com/<your-username>/ai-portfolio.git

# 4. Push to GitHub
git push -u origin main
```

---

## ⚙️ Activating GitHub Pages in your Repository Settings

Once pushed to GitHub:
1. Open your repository on [GitHub.com](https://github.com).
2. Click **⚙️ Settings** at the top.
3. In the left navigation menu, click **Pages** (under the "Code and automation" section).
4. Under **Build and deployment**:
   - **Source**: Select `Deploy from a branch`
   - **Branch**: Select `main`
   - **Folder**: Select `/ (root)`
5. Click **Save**.
6. Wait 30–60 seconds. GitHub will display your live public URL:
   ```
   https://<your-username>.github.io/ai-portfolio/
   ```

---

## 💻 Local Offline Preview
To view the portfolio locally on your machine before publishing:
- Simply double-click **`index.html`** or open it in any browser (Chrome, Edge, Brave, Firefox).
- Or run a local HTTP server:
  ```bash
  python -m http.server 3000
  ```
  Then visit `http://localhost:3000`.

---

## 📄 Associated Documents
- **`AI_PORTFOLIO_MASTER.md`**: Master technical catalog located in parent folder (`C:\Users\Meeko\AI_PORTFOLIO_MASTER.md`) with exhaustive architecture breakdowns, data flow diagrams, and deep dives.
- **`EXECUTIVE_AI_CAPABILITY_STATEMENT.md`**: 2-page C-level brief located at `C:\Users\Meeko\EXECUTIVE_AI_CAPABILITY_STATEMENT.md`.
