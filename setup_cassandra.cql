-- Assuming setup_cassandra.cql is your setup file
CREATE KEYSPACE IF NOT EXISTS fin_data WITH replication = {
    'class': 'SimpleStrategy',
    'replication_factor': 1  -- suitable for development
};

USE fin_data;

CREATE TABLE IF NOT EXISTS ohlcv (
    symbol text,
    date timestamp,
    open double,
    high double,
    low double,
    close double,
    adj_close double,  -- Added adjusted close
    volume bigint,
    PRIMARY KEY (symbol, date)
);
