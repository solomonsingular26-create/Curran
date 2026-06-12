-- ============================================================
-- Curran Theatre — Scope of Work Hub : Supabase setup  (Matrix 4)
-- Run this once in your Supabase project:  SQL Editor > New query > paste > Run
--
-- If you already ran an OLDER version of this file, the schema has changed
-- (Matrix 4 adds item no., location, completed flag, and separate
-- Client / Architect / Singular notes; the RFI log has been removed).
-- The drop lines below reset everything so the page can re-seed itself.
-- ============================================================

drop table if exists scope_items;
drop table if exists rfis;   -- RFI log removed from the app

-- Scope of Work items (General Conditions & Requirements excluded)
create table scope_items (
  id         uuid primary key default gen_random_uuid(),
  pos        int,
  no         text default '',     -- Item No. (e.g. 02-01)
  lv         text,                -- Level (LL01 (Basement) … Level 04 + Attic-Dome)
  ord        int,                 -- Level sort order
  div        text,                -- MasterFormat division
  descr      text,                -- Scope of Work description
  loc        text default '',     -- Location
  src        text default '',     -- Source / reference
  done       boolean default false, -- Already completed
  snote      text default '',     -- Singular notes
  cdecision  text default '',     -- Client: Accept / Reject / Hold
  cby        text default '',     -- Client initials
  cdt        text default '',     -- Client decision date
  cnote      text default '',     -- Client notes
  adecision  text default '',     -- Architect: Accept / Reject / Hold
  aby        text default '',     -- Architect initials
  adt        text default '',     -- Architect decision date
  anote      text default '',     -- Architect notes
  updated_at timestamptz default now()
);

-- Enable Row Level Security and allow the public (anon) key to read/write.
-- NOTE: the anon key is meant to be public, but anyone who has BOTH the key
-- and your project URL can edit. Keep the page URL private to your team +
-- client. To lock it down later, replace these policies with auth-based ones.
alter table scope_items enable row level security;

create policy "team read scope"   on scope_items for select using (true);
create policy "team write scope"  on scope_items for insert with check (true);
create policy "team update scope" on scope_items for update using (true) with check (true);
create policy "team delete scope" on scope_items for delete using (true);

-- Turn on realtime so edits sync instantly across everyone's browser
do $$ begin
  alter publication supabase_realtime add table scope_items;
exception when duplicate_object then null; end $$;

-- That's it. The web page seeds the table automatically the first time it
-- loads (153 scope items), so you do NOT need to insert any rows here.
