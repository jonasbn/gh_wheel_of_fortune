DROP TABLE projects;

CREATE TABLE projects (id number, name text, url text, available text);

INSERT INTO projects (id, name, url, available) VALUES (1, 'testt', 'http://github.com/jonasbn/testt', 'y');
INSERT INTO projects (id, name, url, available) VALUES (2, 'perl-workflow', 'http://github.com/jonasbn/perl-workflow', 'y');
INSERT INTO projects (id, name, url, available) VALUES (3, 'Business-Tax-VAT', 'http://github.com/jonasbn/Business-Tax-VAT', 'y');

CREATE VIEW IF NOT EXISTS available_projects_v1 AS SELECT id, name, url FROM projects WHERE available = "y";

DROP TABLE app;

CREATE TABLE app (last_db_update number);

INSERT INTO app (last_db_update) VALUES (1469444565);