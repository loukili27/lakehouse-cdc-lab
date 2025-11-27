## CDC Proof (Postgres -> Debezium -> Kafka)

### What is running
- Debezium connector `pg-cdc-connector`: RUNNING (connector + task)
- Replication slot: `dbz_slot` is active
- Topics created:
  - `app.public.customers`
  - `app.public.orders`

### Event semantics (Debezium)
- `op = r` : snapshot (initial read)
- `op = c` : insert (create)
- `op = u` : update
- `op = d` : delete
- `snapshot = false` : live CDC (not snapshot)

### Reproduce (Windows / PowerShell)
```powershell
# 1) start stack
docker compose up -d

# 2) check connector status
Invoke-RestMethod http://localhost:8083/connectors/pg-cdc-connector/status | ConvertTo-Json -Depth 10

# 3) insert new row (produces op=c)
docker exec -it pg psql -U app -d appdb -c "INSERT INTO customers(name, gender) VALUES ('DemoUser','M');"

# 4) consume events (filter DemoUser)
docker exec -it kafka bash -lc "kafka-console-consumer --bootstrap-server kafka:29092 --topic app.public.customers --from-beginning --max-messages 200 | grep DemoUser"
