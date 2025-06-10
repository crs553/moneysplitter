CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL
);

CREATE TABLE expenses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  amount REAL NOT NULL,
  payer_id INTEGER NOT NULL,
  description TEXT,
  FOREIGN KEY (payer_id) REFERENCES users(id)
);

CREATE TABLE expense_participants (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  expense_id INTEGER,
  user_id INTEGER,
  expense_percentage INTEGER,
  FOREIGN KEY (expense_id) REFERENCES expenses(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

