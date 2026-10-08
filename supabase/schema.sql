-- SafarGo schema: run in Supabase SQL Editor
create table if not exists users (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  email text not null,
  phone text,
  created_at timestamptz default now()
);
create table if not exists hotels (
  id text primary key,
  name text not null,
  city text not null,
  location text,
  rating numeric(2,1),
  price_per_night integer not null,
  review_count integer default 0,
  description text,
  facilities text[] default '{}',
  rooms jsonb default '[]',          -- e.g. [["Deluxe Room",28000]]
  gradient text,                     -- e.g. '#8a4b2b,#2C0901'
  image_url text
);
create table if not exists bookings (
  id uuid primary key default gen_random_uuid(),
  booking_ref text unique not null,
  user_id uuid references users(id),
  hotel_id text not null,
  hotel_name text,
  room_type text,
  check_in date not null,
  check_out date not null check (check_out > check_in),
  guests int not null check (guests > 0),
  rooms int not null default 1,
  total_price integer not null,
  special_request text,
  status text not null default 'confirmed' check (status in ('pending','confirmed','cancelled')),
  created_at timestamptz default now()
);
alter table users enable row level security;
alter table hotels enable row level security;
alter table bookings enable row level security;
create policy "public read hotels" on hotels for select using (true);
create policy "anyone can create user" on users for insert with check (true);
create policy "anyone can create booking" on bookings for insert with check (true);
-- No public SELECT on users/bookings (protects customer data). Add auth-based policies later.
