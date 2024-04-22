#!/bin/bash

#Configuration des variables
PG_USER="utilisateur"
PG_PASSWORD="motdepasse"
PG_DB="entreprise"
PG_HOST="localhost"
BACKUP_DIR="/var/lib/postgresql/backup"
BACKUP_NAME="db-backup_$(date +'%Y-%m-%d_%H-%M-%S').sql"

#pg_dump
export PGPASSWORD=$PG_PASSWORD
pg_dump -h $PG_HOST -U $PG_USER -d $PG_DB -F c -f "$BACKUP_DIR/BACKUP_NAME"

unset PGPASSWORD
