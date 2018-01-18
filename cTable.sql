CREATE TABLE IF NOT EXISTS :n(
	id serial primary key,
	A varchar,
	B varchar,
	date_quote varchar
);
CREATE TABLE IF NOT EXISTS temporal_table(
        id serial primary key,
        A varchar,
        B varchar,
        date_quote varchar
);
