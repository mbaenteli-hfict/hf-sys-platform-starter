# HF-ICT Systemtechnik – Event 09: Platform Engineering & IaC

Dieses Repository ist eure Arbeitsumgebung für **Event 09 am 03.12.2026 (4 × 45 Minuten)**.
Ihr baut und prüft genau jene Container- und Automatisierungs-Plattform, auf der in **Event 10** Anwendungen per Chat-Prompt und CI/CD-Pipeline in Minuten live geschaltet werden.

## Schnellstart in GitHub Codespaces (0 CHF, keine Installation)
1. Klickt oben rechts auf **Use this template** → **Create a new repository** und legt die Kopie in eurem **persönlichen GitHub-Konto** an (das Gratis-Kontingent für Codespaces gilt nur für persönliche Konten, nicht für Organisationen).
2. Öffnet eure Kopie und klickt auf **Code** → Tab **Codespaces** → **Create codespace on main**.
3. Wartet ca. 60 Sekunden, bis der DevContainer bereit ist (`docker --version` und `terraform --version` sind vorinstalliert).
4. Arbeitet in eurem 2er-Tandem gemäss den Beilagen (`Sprint 1` bis `Sprint 4`).

## Verzeichnisstruktur
- `app/` & `tests/` – Minimale Python-Flask-Web-App inkl. `/health`-Endpoint und `pytest`-Tests
- `Dockerfile` – Produktionsnahe Bauanleitung (Non-Root-User `appuser`, Port `8080`)
- `terraform-local/` – Lokales Infrastructure as Code mit dem Docker-Provider (Sprint 2)
- `audit-dossier/` – Fehlerhafte CI/CD- und Entra-ID-OIDC-Konfigurationen für das Security-Audit (Sprint 3)
- `terraform-azure/` – Imperatives Bash-Skript vs. deklarativer Azure-Terraform-Blueprint (Sprint 4)
