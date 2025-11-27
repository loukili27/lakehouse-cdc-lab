# lakehouse-cdc-lab

## Purpose
Build a **local Data Engineering lab** that demonstrates real-world patterns:
**Postgres (OLTP) → Debezium (CDC) → Kafka → Data Lake (MinIO) → (next) Bronze/Silver/Gold + SQL serving + tests**.

## Status (current)
✅ CDC is working end-to-end: **replication slot active**, Debezium connector running, Kafka topics created and events validated.
✅ MinIO is running as local S3 storage (datalake target).
⏳ Next step: land Kafka topics into MinIO as **Bronze** (S3 sink connector), then add Trino + dbt.

## Roadmap
- [x] Docker stack: Postgres + Kafka + Kafka UI + Debezium Connect
- [x] Postgres logical replication enabled (`wal_level=logical`)
- [x] Debezium Postgres connector created (`pg-cdc-connector`)
- [x] CDC validated: topics `app.public.customers` and `app.public.orders`
- [x] Replication slot active (`dbz_slot`)
- [x] MinIO running (local S3)
- [ ] Kafka → MinIO Bronze (S3 sink connector)
- [ ] Trino query layer on Bronze/Silver
- [ ] dbt models (silver/gold) + tests
- [ ] (optional) Airflow orchestration + backfills

## Quick demo (what you can verify)
### 1) Start the stack
```bash
docker compose up -d
