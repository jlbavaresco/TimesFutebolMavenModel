#!/bin/bash
BANCO="timesfutebol"
USUARIO=postgres
SENHA=postgres
HOST=localhost
PORTA=5432
printf "Efetuando backup completo do banco de dados $BANCO"
echo 
export PGUSER=$USUARIO
export PGPASSWORD=$SENHA
/usr/lib/postgresql/11/bin/pg_dump --host $HOST --port $PORTA --username $USUARIO --verbose  -c $BANCO > backup_completo.sql
