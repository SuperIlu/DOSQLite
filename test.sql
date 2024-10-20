CREATE TABLE test (id INTEGER PRIMARY KEY, name TEXT);
INSERT INTO test (id, name) VALUES (42, 'zweiundvierzig');
INSERT INTO test (id, name) VALUES (23, 'dreiundzwanzig');
INSERT INTO test (id, name) VALUES (23, 'dreiundzwanzig');

SELECT * from test;
SELECT * from test WHERE id=23;
SELECT * from test WHERE id=1;
SELECT COUNT(*) AS CNT from test;
