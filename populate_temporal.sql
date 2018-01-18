INSERT INTO :n
(A, B, date_quote)
SELECT
    A,
    B,
    date_quote
FROM
    temporal_table;

TRUNCATE TABLE temporal_table;
