CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  text varchar(240),
  bookmark_id integer REFERENCES bookmarks(id)
);
