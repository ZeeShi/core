<div align="center">

# 🏛️ CORE

**Rails 8 monolith powering the complete rectorspace.com ecosystem**

[![Live](https://img.shields.io/badge/🌐_Live-rectorspace.com-41CFFF?style=for-the-badge)](https://rectorspace.com)
[![Ruby](https://img.shields.io/badge/Ruby_on_Rails_8-CC0000?style=for-the-badge&logo=rubyonrails&logoColor=white)](https://rubyonrails.org)
[![Tailwind](https://img.shields.io/badge/Tailwind_CSS_v4-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white)](https://tailwindcss.com)

✅ **Production Ready** | 🚀 **Built in 48 Hours** | 🕌 **Built with Ihsan**

[🌐 Visit Live](https://rectorspace.com) • [📖 Read Story](https://rectorspace.com/work/core) • [🏛️ RECTOR LABS](https://github.com/RECTOR-LABS)

</div>

---

## 🎯 The Vision

A single monolithic platform serving as the complete digital presence for RECTOR—combining portfolio, experiments, writings, Islamic resources, and developer tools under one unified architecture.

**Philosophy:** "Building for Eternity" - where technical excellence (dunya) meets purposeful impact (akhirah).

---

## ✨ The 7-Section Architecture

CORE is a Rails 8 monolith serving `rectorspace.com` with route-based sections:

| Section | Route | Purpose | Status |
|---------|-------|---------|--------|
| 🏠 **Homepage** | `/` | Identity hub & project showcase | ✅ Live |
| 💼 **Work** | `/work` | Story-driven project narratives | ✅ Live |
| 🧪 **Labs** | `/labs` | Experiments & learning projects | 📋 Planned |
| ✍️ **Journal** | `/journal` | Blog & writings (Ghost CMS) | 📋 Planned |
| 📚 **Cheatsheet** | `/cheatsheet` | Developer reference & notes | 📋 Planned |
| 🕌 **Dakwa** | `/dakwa` | Islamic da'wah content | 📋 Planned |
| 📖 **Quran** | `/quran` | Quranic resources & tools | 📋 Planned |

**Why monolith?** Unified codebase, shared authentication, single deployment, faster iteration, lower operational complexity.

---

## 🛠️ Tech Stack

**Backend:**
- Ruby on Rails 8 (latest stable)
- PostgreSQL (primary database)
- Solid Queue (background jobs)
- Action Cable (WebSockets)

**Frontend:**
- Tailwind CSS v4 (utility-first styling)
- Hotwire (Turbo + Stimulus)
- JetBrains Mono typography
- Responsive design (mobile-first)

**Infrastructure:**
- VPS deployment (Nginx + Puma)
- GitHub Actions CI/CD
- Let's Encrypt SSL
- Hourly GitHub API sync

**Integrations:**
- GitHub API (project metadata)
- Ghost CMS API (planned - journal)
- Quran API (planned - Quran section)

---

## 🚀 Quick Start

### Prerequisites

```bash
- Ruby 3.3+ (use rbenv or asdf)
- Rails 8
- PostgreSQL 15+
- Node.js 18+ (for asset pipeline)
```

### Installation

```bash
# Clone the repository
git clone https://github.com/RECTOR-LABS/core.git
cd core

# Install dependencies
bundle install

# Set up environment
cp .env.example .env
# Add your GITHUB_TOKEN to .env

# Database setup
bin/rails db:setup

# Sync GitHub repos (initial sync)
bin/rails github:sync

# Start development server
bin/dev
# or just: bin/rails server

# Visit http://localhost:3000
```

### Development Commands

```bash
# Console
bin/rails console

# Database operations
bin/rails db:migrate
bin/rails db:seed
bin/rails db:reset

# GitHub integration
bin/rails github:sync           # Manual sync
bin/rails github:tech_stack     # Show tech summary

# Tests
bin/rails test

# Asset compilation
bin/rails assets:precompile
```

---

## 📖 Architecture Highlights

### GitHub Integration
- **Automatic caching:** All repos cached in PostgreSQL
- **Hourly sync:** Solid Queue job updates metadata
- **Tech stack parser:** Analyzes languages and categorizes projects
- **Rate limiting:** 5,000 requests/hour with token

**Data Flow:**
```
GitHub API → GithubApiService → GithubRepo (model) → PagesController → Homepage View
                ↓
           SyncGithubReposJob (hourly via Solid Queue)
                ↓
           TechStackParser (categorizes languages)
```

### Work Section (Story-Driven)
- **Markdown narratives:** Story-focused, not traditional portfolio
- **Redcarpet rendering:** Clean, semantic HTML output
- **Custom CSS:** Justified text, generous spacing for readability
- **GitHub metadata:** Stars, forks, live URLs integrated

**Custom Slash Command:** `/work:story <github-url>` generates AI-powered narratives

### Design System
- **Color palette:** NFT-inspired warm theme
  - Primary: Sky Blue `#41CFFF`, Warm Yellow `#F9C846`
  - Base: Soft Cream `#FFF7E1`, Deep Brown `#3B2C22`
- **Typography:** JetBrains Mono (full stack - headings, body, code)
- **Layout:** DHH.dk inspired - minimal nav, letter-style narrative
- **Identity:** Anonymous via NFT profile picture

Full design specs: [`docs/DESIGN_SYSTEM.md`](docs/DESIGN_SYSTEM.md)

---

## 🌟 Key Features

### Currently Live (Nov 2025)

✅ **Homepage**
- Dynamic project showcase from GitHub
- Tech stack summary with categorization
- NFT profile picture, warm theme design
- Responsive layout, semantic HTML

✅ **Work Section**
- Story-driven project pages (narrative format)
- Markdown rendering with custom CSS
- GitHub repository metadata
- Individual project pages (`/work/:slug`)

✅ **GitHub Sync**
- Hourly background job via Solid Queue
- 35 repos cached (24 personal + 11 org)
- Tech stack parser with language analysis
- Manual sync via rake tasks

✅ **Production Infrastructure**
- Live at [rectorspace.com](https://rectorspace.com)
- CI/CD via GitHub Actions
- SSL with Let's Encrypt
- VPS deployment (Nginx + Puma)

### Coming Soon

🚧 **Labs Section** - Experiments and learning projects
🚧 **Journal Section** - Ghost CMS integration for blog
🚧 **Cheatsheet Section** - Developer reference notes
🚧 **Dakwa Section** - Islamic da'wah content
🚧 **Quran Section** - Quranic resources and tools

---

## 📊 Current Stats

**Built:** Nov 2-3, 2025 (one weekend!)
**Status:** Live in production
**Sections:** 2/7 complete (Homepage + Work)
**Repositories Tracked:** 35 (18 non-fork)
**Tech Stack:** TypeScript (44.4%), Shell (16.7%), JavaScript, Rust, Python
**Commits:** 15+ in first 3 days
**Deploy Time:** < 5 minutes (CI/CD)

---

## 🎨 Design Philosophy

**Inspirations:**
- **DHH.dk:** Minimal navigation, letter-style narrative, embedded links
- **Basecamp:** Generous whitespace, conversational tone, calm spacing

**Principles:**
- **Content-first:** No navbar/footer/sidebar clutter
- **Scannable:** Clear hierarchy, generous line height (1.75-1.875)
- **Warm aesthetic:** Light theme only, NFT-inspired colors
- **Monospace beauty:** JetBrains Mono everywhere (18px for readability)

**Brand Assets:**
- 3 logo variants + NFT profile picture
- Pixel art graphics from Kenney.nl
- Custom color palette with warm tones

---

## 🏆 Build Story

**Timeline:**
- **Saturday (Nov 2):** Rails 8 initialization, design system, homepage with GitHub integration
- **Sunday (Nov 3):** Work section, story rendering, production deployment, CI/CD setup
- **Result:** Fully functional, production-ready platform in 48 hours

**Philosophy Applied:**
- ✅ **100% Working Standard:** Every feature fully functional before deployment
- ✅ **Ihsan (Excellence):** Beautiful design, clean code, thoughtful UX
- ✅ **Amanah (Responsibility):** Production-ready, secure, maintainable
- ✅ **No Israf (Waste):** Efficient architecture, minimal dependencies

**Lessons Learned:**
- Rails 8 is blazingly fast for monolithic apps
- Monoliths > microservices for solo developers
- Design system upfront = faster implementation
- GitHub API + caching = perfect project showcase

---

## 🗺️ Roadmap

**Phase 1: Foundation** ✅ (Nov 2-3, 2025)
- [x] Rails 8 initialization
- [x] Homepage with GitHub integration
- [x] Work section with story narratives
- [x] Production deployment + CI/CD
- [x] Design system implementation

**Phase 2: Content Expansion** 🚧 (Nov-Dec 2025)
- [ ] Labs section (experiments showcase)
- [ ] Journal section (Ghost CMS integration)
- [ ] Cheatsheet section (developer notes)

**Phase 3: Islamic Platforms** 📋 (Q1 2026)
- [ ] Dakwa section (da'wah content)
- [ ] Quran section (resources + tools)
- [ ] Islamic content strategy

**Phase 4: Advanced Features** 📋 (Q2 2026)
- [ ] Search functionality across all sections
- [ ] RSS feeds for Journal
- [ ] Analytics dashboard
- [ ] Performance optimization

---

## 🤝 Contributing

Built by RECTOR LABS with **Ihsan** (excellence) and **Amanah** (responsibility).

**Contribution Areas:**
- 🐛 Bug reports and fixes
- 🎨 Design improvements
- 📖 Documentation enhancements
- 🚀 Feature suggestions
- 🔍 Code reviews

**Guidelines:**
1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'feat: Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

**Standards:**
- Follow Rails conventions and best practices
- Write tests for new features
- Update documentation as needed
- Keep commits atomic and well-described

---

## 📄 License

This project is open source and available under the MIT License.

---

## 🔗 Links

- 🌐 **Website:** [rectorspace.com](https://rectorspace.com)
- 📖 **Project Story:** [rectorspace.com/work/core](https://rectorspace.com/work/core)
- 🐙 **Personal GitHub:** [@rz1989s](https://github.com/rz1989s)
- 🏛️ **Organization:** [RECTOR-LABS](https://github.com/RECTOR-LABS)

---

## 🙏 Acknowledgments

- **Ruby on Rails** - DHH and the Rails core team for Rails 8
- **Tailwind CSS** - Adam Wathan for the best CSS framework
- **Kenney.nl** - Free pixel art assets
- **GitHub** - For the amazing API and platform
- **Superteam** - Inspiring the blockchain journey
- **Allah SWT** - For the ability to create and learn

---

<div align="center">

**Built with Bismillah** 🕌

*May this platform bring benefit to those who visit. Aamiin.*

---

[🏛️ RECTOR LABS](https://github.com/RECTOR-LABS) | Building for Eternity | 2025

[![Ruby on Rails](https://img.shields.io/badge/Rails_8-CC0000?style=flat&logo=rubyonrails&logoColor=white)](https://rubyonrails.org)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=flat&logo=postgresql&logoColor=white)](https://postgresql.org)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-06B6D4?style=flat&logo=tailwindcss&logoColor=white)](https://tailwindcss.com)
[![Deployed](https://img.shields.io/badge/Deployed-rectorspace.com-41CFFF?style=flat)](https://rectorspace.com)

</div>
