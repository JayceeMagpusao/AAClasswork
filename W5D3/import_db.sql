PRAGMA foreign_keys = ON;

DROP TABLE question_likes;
DROP TABLE replies;
DROP TABLE questions_follows;
DROP TABLE questions;
DROP TABLE users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);



CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);



CREATE TABLE questions_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);



CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    reply_id INTEGER,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (reply_id) REFERENCES replies(id)
);



CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_like BOOLEAN,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Patrick', 'Mahomes'),
    ('Kevin', 'Hart'),
    ('Justin', 'Beiber'),
    ('Dwayne', 'Johnson');

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('Football', 'How do I throw a ball?', (SELECT id FROM users WHERE fname = 'Patrick') ),
    ('Comedy', 'Am I good at standup?', (SELECT id FROM users WHERE fname = 'Kevin') ),
    ('Sing', 'How can I sing better?', (SELECT id FROM users WHERE fname = 'Justin') ),
    ('Body Building', 'How do i get stronger?', (SELECT id FROM users WHERE fname = 'Dwayne') );

INSERT INTO
    questions_follows (question_id, user_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

INSERT INTO
    replies (question_id, user_id, reply_id, body)
VALUES
    (1, 1, NULL, "Reply 1"),
    (2, 2, NULL, "Reply 2"),
    (2, 2, 2, "This is how I make a joke"),
    (1, 1, 1, "This is how I throw a football");
    
INSERT INTO
    question_likes (user_like, user_id, question_id)
VALUES  
    (true, 1, 1),
    (false, 2, 2),
    (true, 3, 3),
    (false, 4, 4);