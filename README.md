# Bookmark Manager

## Usage
### set up the project
clone this repo:
```
https://github.com/karelmolina/bookmark_manager.git
```
then run:
```sh
 bundle install
 ```
### set up database 
connect to `psql` and create the databases `bookmarks_manager` and `bookmarks_manager_test`
```
CREATE DATABASE bookmarks_manager;
CREATE DATABASE bookmarks_manager_test;
```
to set correct the tables access to `db/migrations` and execute the script in each database. 
### Run the app
```sh
rackup
```
### Run the tests
```sh
rspec
```


## User Stories
```
As a user
So that I can go faster to website than i regular visit
I would like to see all of bookmarks"
```

```
As a user
So I can store bookmark data for later retrieval
I want to add a bookmark to Bookmark Manager
```

```
As a user
So that I can keep my bookmarks relevant
I want to delete a bookmark
```

```
As a user
So that I can keep my bookmarks up to date
I want to edit a bookmark
```

```
As a user
So that the bookmarks I save are useful
I want to only save a valid URL
```

```
As a user
So that I can make interesting notes
I want to add a Comment to a Bookmark
```

```
As a user
So that I can have a personalised bookmark list
I want to sign up with my email address
```

```
As a user
So that I can keep my account secure
I want to sign in with my email and password
```

```
As a user
So that I can keep my account secure
I want to sign out
```

## Domain Model
![Domain Model](./public/images-md/DomainModel.png)
