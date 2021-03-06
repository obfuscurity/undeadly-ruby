PRAGMA foreign_keys = ON;
CREATE TABLE users(
   id INTEGER PRIMARY KEY,
   role_id INTEGER,
   username VARCHAR(255),
   password VARCHAR(255),
   firstname VARCHAR(255),
   lastname VARCHAR(255),
   email VARCHAR(255),
   url TEXT,
   tz VARCHAR(255),
   reputation INTEGER,
   FOREIGN KEY(role_id) REFERENCES roles(id)
);
CREATE TABLE roles(
   id INTEGER PRIMARY KEY,
   name TEXT,
   manage_admins BOOLEAN,
   manage_editors BOOLEAN,
   manage_users BOOLEAN,
   edit_articles BOOLEAN,
   delete_articles BOOLEAN,
   create_articles BOOLEAN,
   edit_comments BOOLEAN,
   delete_comments BOOLEAN,
   create_comments BOOLEAN,
   read_articles BOOLEAN
);
CREATE TABLE articles(
   id INTEGER PRIMARY KEY,
   revision_id INTEGER,
   topic_id INTEGER,
   status VARCHAR(255),
   FOREIGN KEY(revision_id) REFERENCES revisions(id),
   FOREIGN KEY(topic_id) REFERENCES topics(id)
);
CREATE TABLE revisions(
   id INTEGER PRIMARY KEY,
   article_id INTEGER,
   user_id INTEGER,
   epoch INTEGER,
   title TEXT,
   dept TEXT,
   content TEXT,
   description TEXT,
   format VARCHAR(255),
   FOREIGN KEY(article_id) REFERENCES articles(id),
   FOREIGN KEY(user_id) REFERENCES users(id)
);
CREATE TABLE topics(
   id INTEGER PRIMARY KEY,
   name TEXT,
   description TEXT,
   image_url TEXT
);
CREATE TABLE comments(
   id INTEGER PRIMARY KEY,
   article_id INTEGER,
   user_id INTEGER,
   epoch INTEGER,
   title TEXT,
   content TEXT,
   score INTEGER,
   FOREIGN KEY(article_id) REFERENCES articles(id),
   FOREIGN KEY(user_id) REFERENCES users(id)
);
CREATE TABLE events(
   id INTEGER PRIMARY KEY,
   type TEXT,
   message TEXT
);
