# SafarGo – Hotel Booking Website
Static site: `index.html` (HTML/CSS/vanilla JS, hash routing), `config.js`, `supabase/schema.sql`.
## Brand
Dark Chocolate #2C0901, Cream #FFF4E8, accent tan #C9A27A. Elegant, warm, premium, rounded cards (22px).
## Rules
- Never hardcode Supabase credentials; they go only in `config.js` (empty = localStorage demo mode).
- No extra frameworks or pages. Escape all user text with `esc()`.
- Routes: `#/`, `#/hotels`, `#/hotel/:id`, `#/book/:id`, `#/confirm/:ref`.
## Test
Open `index.html` → search → view hotel → book → confirm page shows Booking ID. Check console is clean at 375px, 768px, 1280px.
## Deploy
Push to GitHub, connect repo to Netlify (no build command, publish dir `/`).
