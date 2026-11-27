# Basis-Image fuer den Codespace von Event 09
FROM mcr.microsoft.com/devcontainers/python:1-3.12-bookworm

# Die im Image enthaltene Yarn-Paketquelle hat einen ungueltigen Signaturschluessel.
# Sie wird entfernt, damit apt-get update (und damit die Docker- und Terraform-Installation) funktioniert.
RUN rm -f /etc/apt/sources.list.d/yarn*.list
