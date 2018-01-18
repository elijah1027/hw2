

for file in ~/data/hw1/inclass2/*; do
	
	#file=~/data/hw1/taqtrade20141201
	date=${file:(-8)}
	tname=table${file:(-8)}
	#echo $date
	#echo $tname
	PGPASSFILE=~/db/.pgpass psql -h rds-postgresql.clahixkkwlcw.us-east-1.rds.amazonaws.com --port=5432 --username administrator --dbname stockdata -f cTable.sql -v n=$tname
	schema='(A,B,date_quote)'
	sed  '1 d' $file | sed 's/[^[:alnum:]]\+$//;s/ \{1,\}/,/g' | sed 's/,/-/2g' |  sed "s/$/,$date/g"| sed '1i A,B,date_quote'| sed $'s/\r$//' | sed '/^$/d'|PGPASSFILE=~/db/.pgpass psql -h rds-postgresql.clahixkkwlcw.us-east-1.rds.amazonaws.com --port=5432 --username administrator --dbname stockdata -c "COPY temporal_table ${schema} FROM stdin CSV HEADER;"
	PGPASSFILE=~/db/.pgpass psql -h rds-postgresql.clahixkkwlcw.us-east-1.rds.amazonaws.com --port=5432 --username administrator --dbname stockdata -f populate_temporal.sql -v n=$tname
done
