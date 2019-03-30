create table bookmarks_tags (
  id SERIAL PRIMARY KEY,
  bookmark_id integer REFERENCES bookmarks(id),
  tag_id integer REFERENCES tags(id)
);
