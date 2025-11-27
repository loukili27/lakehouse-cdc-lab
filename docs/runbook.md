# Runbook — lakehouse-cdc-lab

This runbook documents how to start the local stack and validate **CDC end-to-end**
(Postgres → Debezium → Kafka), plus common troubleshooting.

## Prerequisites
- Docker Desktop running
- PowerShell (Windows)

## Stack overview
- Postgres (OLTP): `localhost:5432`
- Debezium Connect API: `http://localhost:8083`
- Kafka UI: `http://localhost:8088`
- MinIO Console: `http://localhost:9001` (user: `minio`, pass: `minio12345`)

---

## 1) Start / Stop

### Start
```powershell
docker compose up -d
docker ps
