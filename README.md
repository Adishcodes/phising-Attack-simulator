# GoPhish Phishing Simulation (Offline)

## Overview
This repository contains artifacts for a safe, offline phishing simulation using GoPhish and MailHog. The purpose is educational: to demonstrate how phishing campaigns work and how captured credential pages behave.

**Ethics:** All tests MUST use only email addresses owned by the tester. No real users are targeted.

## Files
- `landing_page.html` — Landing page (fake login) HTML
- `email_template.html` — Email template (uses `{{.URL}}` placeholder)
- `recipients.csv` — Target list (replace with your test addresses)
- `phishing-report.md` — Short report summarizing the exercise
- `setup-script.sh` — Optional helper script to download MailHog & GoPhish and create files
- `screenshots/` — Put screenshots here (MailHog UI, GoPhish campaign screen, landing page)

## Quick run (manual)
1. Start MailHog (SMTP catcher) and GoPhish on your VM (see `setup-script.sh` for automation).
2. In GoPhish admin UI:
   - Create a Sending Profile pointing to MailHog (`127.0.0.1:1025`, no auth, ignore TLS).
   - Create a Landing Page and paste `landing_page.html`.
   - Create an Email Template and paste `email_template.html`.
   - Import `recipients.csv` (Users & Groups).
   - Create and launch a campaign (select sending profile, template, landing page and group).
3. Check MailHog UI (`http://127.0.0.1:8025`) to view intercepted emails.
4. Open the link, submit test credentials if you want to show captured fields (only test accounts).
5. Take screenshots and add them to `screenshots/`.

## Deliverable
Upload this repository (with screenshots) to your assignment submission. Include the repo link and mention that all tests used only test accounts.
