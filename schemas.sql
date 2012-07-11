CREATE TABLE owners(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username VARCHAR(64),
  full_name VARCHAR(64),
  email VARCHAR(64),
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);

INSERT INTO owners
(username, full_name, email, created_at, updated_at)
VALUES
('Devbootcamp', 'Dev Bootcamp', 'apprentice@devbootcamp.com', DATETIME('now'), DATETIME('now'));

CREATE TABLE repos(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(64) NOT NULL,
  owner_id INTEGER,
  source_url VARCHAR(64),
  last_commit CHAR(40),
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  hidden_at DATETIME,
  FOREIGN KEY(owner_id) REFERENCES owners(id)
);

CREATE TABLE repo_reports(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  repo_id INTEGER NOT NULL,
  owner_id INTEGER,
  commit CHAR(40),
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  hidden_at DATETIME,
  FOREIGN KEY(repo_id) REFERENCES repos(id),
  FOREIGN KEY(owner_id) REFERENCES owners(id)
);

CREATE TABLE methods(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  method_name VARCHAR(64) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);