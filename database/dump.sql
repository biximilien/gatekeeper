--
CREATE DATABASE grafana WITH OWNER = postgres;

--
CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(255) NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL
);

INSERT INTO users (username, email, password) VALUES ('admin', 'admin@example.org', md5('admin'));
INSERT INTO users (username, email, password) VALUES ('user', 'admin@example.org', md5('user'));
