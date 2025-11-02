# Git Submodules Guide for RECTOR LABS

**Version:** 1.0
**Last Updated:** 2025-11-02

---

## 1. Overview

This guide explains how RECTOR LABS uses git submodules to manage the ecosystem of projects within the CORE repository.

### Why Submodules?

**Benefits:**
- ✅ **Independent Development:** Each project has its own repository, history, and releases
- ✅ **Centralized Organization:** All projects accessible from CORE repo
- ✅ **Flexible Deployment:** Deploy projects independently or together
- ✅ **Portfolio-Friendly:** Each repo can be showcased separately on GitHub
- ✅ **Version Control:** Pin CORE to specific versions of each project

**Structure:**
```
RECTOR-LABS/
├── core                    # 🔒 PRIVATE - This repo (parent/orchestrator)
│   └── projects/
│       ├── homepage/       # Submodule → RECTOR-LABS/homepage (PUBLIC)
│       ├── portfolio/      # Submodule → RECTOR-LABS/portfolio (PUBLIC)
│       ├── labs/           # Submodule → RECTOR-LABS/labs (PUBLIC)
│       ├── cheatsheet/     # Submodule → RECTOR-LABS/cheatsheet (PUBLIC)
│       ├── dakwa/          # Submodule → RECTOR-LABS/dakwa (PUBLIC)
│       └── quran/          # Submodule → RECTOR-LABS/quran (PUBLIC)
├── homepage                # 🌐 PUBLIC - Standalone repo
├── portfolio               # 🌐 PUBLIC - Standalone repo
└── ...                     # Other standalone repos

**Repository Visibility:**
- CORE: 🔒 PRIVATE (internal planning, strategies, ecosystem overview)
- Platforms: 🌐 PUBLIC (default) or 🔒 PRIVATE (case-by-case basis)
```

---

## 2. Essential Commands

### 2.1 Cloning

**Clone CORE with all submodules:**
```bash
git clone --recurse-submodules git@github.com:RECTOR-LABS/core.git
```

**Clone CORE first, then initialize submodules:**
```bash
git clone git@github.com:RECTOR-LABS/core.git
cd core
git submodule update --init --recursive
```

**Clone specific submodule only:**
```bash
git submodule update --init projects/homepage
```

---

### 2.2 Adding Submodules

**Add new project as submodule:**
```bash
# From CORE repo root
git submodule add git@github.com:RECTOR-LABS/<repo-name>.git projects/<repo-name>

# Example: Add homepage
git submodule add git@github.com:RECTOR-LABS/homepage.git projects/homepage

# Commit the submodule addition
git add .gitmodules projects/homepage
git commit -m "Add homepage as submodule"
git push origin main
```

---

### 2.3 Updating Submodules

**Update all submodules to latest commit on their main branch:**
```bash
git submodule update --remote --merge
```

**Update specific submodule:**
```bash
git submodule update --remote --merge projects/homepage
```

**Pull latest changes in all submodules:**
```bash
git submodule foreach git pull origin main
```

**Commit submodule updates in CORE:**
```bash
# After updating submodules
git add projects/homepage  # Or specific submodule
git commit -m "Update homepage submodule to latest"
git push origin main
```

---

### 2.4 Working on Submodule Code

**Navigate to submodule and work normally:**
```bash
cd projects/homepage

# Create feature branch
git checkout -b feature/new-hero

# Make changes
# ... edit files ...

# Commit in submodule repo
git add .
git commit -m "Add new hero section"
git push origin feature/new-hero

# Create PR in homepage repo
gh pr create --title "Add new hero section" --body "..."
```

**After merging PR, update CORE to track new commit:**
```bash
# From CORE root
git submodule update --remote --merge projects/homepage
git add projects/homepage
git commit -m "Update homepage to include new hero section"
git push origin main
```

---

### 2.5 Removing Submodules

**Remove submodule (rarely needed):**
```bash
# 1. Deinitialize submodule
git submodule deinit -f projects/homepage

# 2. Remove from git
git rm -f projects/homepage

# 3. Remove from .git/modules
rm -rf .git/modules/projects/homepage

# 4. Commit removal
git commit -m "Remove homepage submodule"
git push origin main
```

---

## 3. Common Workflows

### 3.1 Daily Development Workflow

**Scenario:** Working on homepage feature

```bash
# 1. Ensure you have latest CORE and submodules
cd /path/to/core
git pull origin main
git submodule update --remote --merge

# 2. Navigate to submodule
cd projects/homepage

# 3. Create feature branch
git checkout -b feature/update-contact-form

# 4. Develop, test, commit
npm run dev
# ... make changes ...
git add .
git commit -m "Update contact form validation"

# 5. Push to submodule repo
git push origin feature/update-contact-form

# 6. Create PR (in homepage repo)
gh pr create --title "Update contact form" --body "Added better validation"

# 7. After PR merged, update CORE
cd /path/to/core
git submodule update --remote --merge projects/homepage
git add projects/homepage
git commit -m "Update homepage with new contact form"
git push origin main
```

---

### 3.2 Creating New Project

**Scenario:** Creating cheatsheet.rectorspace.com

```bash
# 1. Create new repo in RECTOR-LABS organization
# Use GitHub UI or gh CLI
gh repo create RECTOR-LABS/cheatsheet --public \
  --description "Developer cheatsheet library - cheatsheet.rectorspace.com"

# 2. Clone and setup project locally
cd ~/projects
git clone git@github.com:RECTOR-LABS/cheatsheet.git
cd cheatsheet

# 3. Initialize project (e.g., Astro)
npm create astro@latest .
# ... setup project ...

# 4. Commit initial setup
git add .
git commit -m "Initial Astro setup for cheatsheet site"
git push origin main

# 5. Add as submodule to CORE
cd /path/to/core
git submodule add git@github.com:RECTOR-LABS/cheatsheet.git projects/cheatsheet

# 6. Commit submodule addition
git add .gitmodules projects/cheatsheet
git commit -m "Add cheatsheet as submodule"
git push origin main
```

---

### 3.3 Deploying Submodule

**Scenario:** Deploy homepage to VPS

```bash
# On VPS (as 'homepage' user)
ssh homepage@rectorspace.com

# Clone submodule repo directly (not via CORE)
cd ~
git clone git@github.com:RECTOR-LABS/homepage.git app
cd app

# Install and build
npm ci --production
npm run build

# Start with PM2
pm2 start npm --name "homepage" -- start
pm2 save
```

**Or via CORE (if preferred):**
```bash
# On VPS
ssh homepage@rectorspace.com
cd ~

# Clone CORE with specific submodule
git clone git@github.com:RECTOR-LABS/core.git
cd core
git submodule update --init projects/homepage

# Symlink or copy to app directory
ln -s ~/core/projects/homepage ~/app
cd ~/app

# Install and deploy as above
```

---

### 3.4 Syncing After Team Changes

**Scenario:** Collaborator updated multiple projects

```bash
# 1. Pull latest CORE
cd /path/to/core
git pull origin main

# 2. Update all submodules to commits tracked by CORE
git submodule update --init --recursive

# 3. Or update to absolute latest on each submodule's main
git submodule update --remote --merge

# 4. If conflicts, resolve per submodule
cd projects/homepage
git status
# ... resolve conflicts ...
git add .
git commit
cd ../..

# 5. Commit submodule updates in CORE if needed
git add projects/*
git commit -m "Sync all submodules to latest"
git push origin main
```

---

## 4. Submodule Configuration

### 4.1 .gitmodules File

The `.gitmodules` file tracks all submodules. Example:

```ini
[submodule "projects/homepage"]
    path = projects/homepage
    url = git@github.com:RECTOR-LABS/homepage.git
    branch = main

[submodule "projects/portfolio"]
    path = projects/portfolio
    url = git@github.com:RECTOR-LABS/portfolio.git
    branch = main

[submodule "projects/labs"]
    path = projects/labs
    url = git@github.com:RECTOR-LABS/labs.git
    branch = main
```

**Track specific branch:**
```bash
# Configure submodule to track 'dev' instead of 'main'
git config -f .gitmodules submodule.projects/homepage.branch dev
git submodule update --remote --merge projects/homepage
```

---

### 4.2 Submodule Status

**Check status of all submodules:**
```bash
git submodule status
```

**Output example:**
```
 a1b2c3d4 projects/homepage (v1.0.0)
 e5f6g7h8 projects/portfolio (v0.5.2)
-i9j0k1l2 projects/labs (heads/main)
```

**Indicators:**
- ` ` (space) - Submodule checked out at commit tracked by CORE
- `-` - Submodule not initialized yet
- `+` - Submodule checked out at different commit than tracked
- `U` - Merge conflict

---

### 4.3 Useful Aliases

Add to `~/.gitconfig`:

```ini
[alias]
    # Update all submodules to latest
    supdate = submodule update --remote --merge

    # Status of all submodules
    sstatus = submodule status

    # Pull latest in all submodules
    spull = submodule foreach git pull origin main

    # Clone with submodules
    sclone = clone --recurse-submodules
```

**Usage:**
```bash
git supdate          # Instead of: git submodule update --remote --merge
git sstatus          # Instead of: git submodule status
git spull            # Pull in all submodules
```

---

## 5. Best Practices

### 5.1 Do's

✅ **Commit submodule changes in CORE after updating:**
- CORE tracks specific commits of submodules
- Update `.gitmodules` reference after merging submodule PRs

✅ **Use branches in submodules:**
- Work on feature branches in each submodule
- Merge to main via PR

✅ **Keep submodules updated:**
- Regularly sync CORE with latest submodule commits
- Run `git submodule update --remote --merge` weekly

✅ **Document submodule purpose:**
- Each submodule repo should have clear README
- Explain relationship to CORE in submodule docs

✅ **Respect visibility boundaries:**
- CORE is PRIVATE - contains internal planning and strategies
- Public submodules: Showcase work, open-source, da'wah content
- Private submodules: Proprietary features, early development
- Never commit CORE-private info to public submodules

### 5.2 Don'ts

❌ **Don't make changes in submodule from CORE without committing:**
- Always navigate to submodule, commit there first
- Then update CORE to track new commit

❌ **Don't forget to push submodule changes:**
- Push to submodule repo first
- Then update CORE

❌ **Don't hardcode dependencies between submodules:**
- Keep submodules independent
- Use shared design system from CORE instead

❌ **Don't use nested submodules:**
- Keep structure flat (all submodules in `projects/`)

❌ **Don't leak private information to public repos:**
- Review code before pushing to public submodules
- Keep sensitive configs, API keys, internal strategies in CORE only
- Use environment variables for secrets in public repos

---

## 6. Troubleshooting

### 6.1 Submodule Out of Sync

**Problem:** Submodule shows changes but you didn't modify it

**Solution:**
```bash
# Check submodule status
git submodule status

# If out of sync, update to tracked commit
git submodule update projects/homepage

# Or update to latest
git submodule update --remote --merge projects/homepage
```

---

### 6.2 Submodule Not Initialized

**Problem:** Submodule folder exists but is empty

**Solution:**
```bash
git submodule update --init --recursive
```

---

### 6.3 Detached HEAD in Submodule

**Problem:** Submodule is in detached HEAD state

**Context:** This is normal! Submodules check out specific commits, not branches.

**To work on submodule:**
```bash
cd projects/homepage
git checkout main  # Switch to main branch
git pull origin main  # Get latest
# Now work normally
```

---

### 6.4 Submodule Merge Conflicts

**Problem:** Conflict when updating submodule

**Solution:**
```bash
cd projects/homepage
git status  # See conflict
# Resolve conflicts
git add .
git commit -m "Resolve merge conflict"
git push origin main

# Return to CORE
cd ../..
git add projects/homepage
git commit -m "Update homepage after resolving conflict"
```

---

### 6.5 Cannot Push to Submodule

**Problem:** Permission denied when pushing to submodule

**Solution:**
```bash
# Check remote URL
cd projects/homepage
git remote -v

# If using HTTPS, switch to SSH
git remote set-url origin git@github.com:RECTOR-LABS/homepage.git

# Verify SSH access
ssh -T git@github.com
```

---

## 7. Advanced Topics

### 7.1 Submodule Foreach

**Run command in all submodules:**
```bash
# Update all submodules
git submodule foreach git pull origin main

# Check status of all
git submodule foreach git status

# Install dependencies in all Node.js submodules
git submodule foreach 'npm install || true'

# Create branch in all submodules
git submodule foreach 'git checkout -b feature/update'
```

---

### 7.2 Shallow Clone

**Clone submodules with limited history (faster):**
```bash
git clone --recurse-submodules --shallow-submodules \
  git@github.com:RECTOR-LABS/core.git
```

**Or configure shallow clone:**
```bash
git config submodule.recurse true
git config submodule.shallow true
```

---

### 7.3 Sparse Checkout

**Clone CORE but only some submodules:**
```bash
# Clone CORE without submodules
git clone git@github.com:RECTOR-LABS/core.git
cd core

# Initialize only specific submodules
git submodule update --init projects/homepage
git submodule update --init projects/portfolio
```

---

## 8. Integration with CI/CD

### 8.1 GitHub Actions

**Checkout with submodules:**
```yaml
- uses: actions/checkout@v3
  with:
    submodules: recursive
    token: ${{ secrets.GITHUB_TOKEN }}
```

**Update submodule in workflow:**
```yaml
- name: Update submodules
  run: |
    git submodule update --remote --merge
    git config user.name "GitHub Actions"
    git config user.email "actions@github.com"
    git add .
    git commit -m "Auto-update submodules" || echo "No changes"
    git push
```

---

## 9. Quick Reference

### Command Cheat Sheet

| Task | Command |
|------|---------|
| Clone with submodules | `git clone --recurse-submodules <url>` |
| Initialize submodules | `git submodule update --init --recursive` |
| Add submodule | `git submodule add <url> <path>` |
| Update all to latest | `git submodule update --remote --merge` |
| Update specific | `git submodule update --remote --merge <path>` |
| Check status | `git submodule status` |
| Run command in all | `git submodule foreach <command>` |
| Remove submodule | See section 2.5 |

---

## 10. Resources

**Official Git Documentation:**
- [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [Pro Git Chapter 7.11](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

**RECTOR LABS Docs:**
- [ARCHITECTURE.md](ARCHITECTURE.md) - Repository architecture
- [README.md](../README.md) - CORE repo overview

---

**Document Metadata:**
- Created: 2025-11-02
- Last Updated: 2025-11-02
- Owner: RECTOR
- Status: Active Reference Guide
