-- name: CreateUser :one
INSERT INTO users (name) VALUES (?) RETURNING *;

-- name: ListUsers :many
SELECT * FROM users;

-- name: CreateExpense :one
INSERT INTO expenses (amount, payer_id, description) VALUES (?, ?, ?) RETURNING *;

-- name: AddExpenseParticipant :exec
INSERT INTO expense_participants (expense_id, user_id) VALUES (?, ?);

-- name: GetAllExpenses :many
SELECT * FROM expenses;

-- name: GetExpenseParticipants :many
SELECT user_id FROM expense_participants WHERE expense_id = ?;

