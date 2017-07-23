
-- 1. Write a query to delete a user named `michael` if it exists

DROP USER IF EXISTS michael;

--NOTICE:  role "michael" does not exist, skipping
--DROP ROLE


-- 1. Write a query to create a user named `michael` with an encrypted password `stonebreaker`

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

-- CREATE ROLE
-- oksanaharris=#

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app;

-- You are now connected to database "todo_app" as user "oksanaharris".
-- todo_app=#

CREATE TABLE tasks (
  id SERIAL NOT NULL PRIMARY KEY,
  title VARCHAR (255) NOT NULL,
  description TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL,
  completed BOOL NOT NULL DEFAULT FALSE
);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at TIMESTAMP DEFAULT NULL;

ALTER TABLE tasks
  ALTER COLUMN updated_at SET DEFAULT NOW(),
  ALTER COLUMN updated_at SET NOT NULL;

INSERT INTO tasks
VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description)
VALUEs ('Study PostreSQL', 'Read all the documentation');

SELECT title FROM tasks WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = NOW() WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at IS NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake 1%';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title;