# Curran Theatre Restoration — Scope of Work Hub

Interactive Scope of Work tracker for the Curran Theatre Restoration
(Singular Builders · 445 Geary St, San Francisco). 153 scope items across
5 levels from **Restoration Scope of Work Matrix 4** (General Conditions &
Requirements excluded). Client and Architect each record Accept / Reject /
Hold per item, with notes — synced live for everyone via Supabase.

## Files

| File | Purpose |
|---|---|
| `index.html` | The entire app (single file, no build step) |
| `config.js` | **The only file you edit** — your Supabase URL + anon key |
| `supabase-setup.sql` | Run once in Supabase to create the database |
| `netlify.toml` | Netlify config (serve repo root, no build) |
| `vercel.json` | Vercel config (static, clean URLs) |

## Setup (one time, ~10 min)

### 1 — Database (Supabase, free)
1. Go to [supabase.com](https://supabase.com) → **New project** (any name, region near SF).
2. Open **SQL Editor → New query**, paste the contents of `supabase-setup.sql`, click **Run**.
3. Go to **Project Settings → API** and copy the **Project URL** and **anon public** key.
4. Paste both into `config.js`.

### 2 — Put it on GitHub
1. Go to [github.com/new](https://github.com/new) → name it (e.g. `curran-scope`) → set **Private** → Create.
2. Click **uploading an existing file**, drag all files from this folder in, **Commit**.

### 3 — Deploy

**Netlify:** [app.netlify.com](https://app.netlify.com) → **Add new site → Import an existing project → GitHub** → pick the repo → leave build settings empty → **Deploy**. Then *Site settings → Change site name* → e.g. `curran-scope.netlify.app`.

**Vercel:** [vercel.com/new](https://vercel.com/new) → import the repo → Framework preset **Other**, no build command → **Deploy**.

Either way you get a live URL to share with the client and architect.
A **green "● Live" banner** at the top means shared sync is on; an amber
banner means the keys in `config.js` aren't set yet (local preview mode).

## Updating later

Edit or replace a file in the GitHub repo (the **Add file / Upload files**
button works fine) and commit — Netlify/Vercel redeploys automatically in
~30 seconds. No more drag-and-drop deploys.

> **Note:** the anon key in `config.js` is public by design — anyone with
> the URL can view *and edit*. Keep the link within the project team.
