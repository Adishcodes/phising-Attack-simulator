# Phishing Simulation Report

## Objective
Run a safe phishing simulation in an offline environment to demonstrate how phishing campaigns work and what data can be captured.

## Environment
- Kali Linux VM
- GoPhish (local)
- MailHog (local SMTP catcher)

## Steps Taken
1. Installed and started MailHog to capture SMTP traffic locally (SMTP:127.0.0.1:1025, web:127.0.0.1:8025).
2. Downloaded and started GoPhish (admin UI: http://127.0.0.1:3333).
3. Created a Sending Profile pointing to MailHog (127.0.0.1:1025).
4. Created a Landing Page using `landing_page.html`.
5. Created an Email Template using `email_template.html`.
6. Imported `recipients.csv` (test accounts only).
7. Launched a campaign and monitored results in GoPhish and MailHog.
8. Captured screenshot evidence and saved results.

## Results (example)
- Emails delivered to MailHog: 2
- Clicks: X
- Submissions (captured credentials): X

## Ethical statement
All recipients were test accounts owned by the tester. No real users were targeted. This simulation is for educational purposes only.

## Files included
- landing_page.html
- email_template.html
- recipients.csv
- screenshots/
