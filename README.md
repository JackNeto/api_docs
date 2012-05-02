# API docs

A tool to help you generate documentation for you API


## Installation

Add gem definition to your Gemfile:
    
``` ruby
gem 'api_docs'
```
    
Bundle it:
    
    bundle install

Add [Twitter bootstrap](http://twitter.github.com/bootstrap) and [Google code pretifyer](http://google-code-prettify.googlecode.com/svn/trunk/README.html) to you CSS manifest file

``` js
//= require bootstrap
//= require prettify
```

Here's what you Javascript manifest file should look like

``` js
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require prettify
//= require api_docs
```

Add your API documentation files to the /doc/api folder and in your view do:

``` ruby
= render_api_docs %w{login users overview}
```

## The API documentaion files
  
``` yaml
'List':
  url: '/users'
  method: GET
  description: |
    Returns a list of users ordered by relationship:
      is_friends_with
      follows
  params:
    api_key:
    keyword: "a string of one or more words used to filter the users by first_name, last_name, username and email (optional)"
  success:
    response: 'HTTP/1.1 200 OK'
    data: |
      {
        "users": [
          {
            "id": 27,
            "first_name": "Andres",
            "last_name": "Aquino",
            "username": "eh_eh",
            "bio": "",
            "avatar_url": "http://.../thumb.jpg",
            "cover_photo_url": "http://.../thumb.jpg",
            "score": 0,
            "relationship": ["is_friends_with"],
            "created_at": "2011-06-13T00:28:36-04:00",
            "updated_at": "2012-04-26T20:21:43-04:00"
          },
          {
            "id": 3,
            "first_name": "Andrew",
            "last_name": "Peek",
            "username": "ap",
            "bio": "A dude.",
            "avatar_url": "http://.../thumb.jpg",
            "cover_photo_url": "http://.../thumb.jpg",
            "score": 0,
            "relationship": ["is_friends_with"],
            "created_at": "2011-06-13T00:28:36-04:00",
            "updated_at": "2012-04-26T20:21:43-04:00"
          },
          ...
        ]
      }
  curl: curl -i :api_url/v1/users?api_key=7gR9hZt3DBqcuzi2mZKN

# ------------------------------

'Show':
  url: '/users/:id'
  method: GET
  description: |
    Returns profile details for a specified user.
    <span class=label>NOTE</span> If showing details of another user the email is ommited
    <span class=label>TODO</span> response is missing the counters (notebooks, notes, comments, rocketed notes, followers, following, activity feed, notifications)
  params:
    api_key:
    id: the id of a user
  success:
    response: 'HTTP/1.1 200 OK'
    data: |
      {
        "user": {
          "id": 917,
          "api_key": "7gR9hZt3DBqcuzi2mZKN",
          "email": "john_smith@gmail.com",
          "first_name": "John",
          "last_name": "Smith",
          "username": "john_smith",
          "bio": "",
          "avatar_url": ""http://.../photo.png",
          "cover_photo_url": null,
          "score": 0,
          "created_at": "2011-06-13T00:28:36-04:00",
          "updated_at": "2012-04-26T20:21:43-04:00"
        }
      }
  fail:
    response: 'HTTP/1.1 404 Not Found'
    data: |
      {
        "message": "User not found"
      }
  curl: curl -i :api_url/v1/users/197?api_key=2a10K5ipBd2qapJsPvCso90kMO

# ------------------------------

'Create':
  url: '/users'
  method: POST
  description: '[TODO] response is missing the counters (notebooks, notes, comments, rocketed notes, followers, following, activity feed, notifications)'
  params:
    user[first_name]:
    user[last_name]:
    user[email]:
    user[username]:
    user[password]:
    user[bio]:
    user[avatar]: "the user's avatar file"
    user[cover_photo]: "the user's cover photo file"
  success:
    response: 'HTTP/1.1 201 Created'
    data: |
      {
        "user": {
          "id": 917,
          "api_key": "7gR9hZt3DBqcuzi2mZKN",
          "email": "john_smith@gmail.com",
          "first_name": "John",
          "last_name": "Smith",
          "username": "john_smith",
          "bio": "",
          "avatar_url": ""http://.../photo.png",
          "cover_photo_url": null,
          "score": 0,
          "created_at": "2011-06-13T00:28:36-04:00",
          "updated_at": "2012-04-26T20:21:43-04:00"
        }
      }
  fail:
    response: 'HTTP/1.1 422 Unprocessable Entity'
    data: |
      {
        "message": "Failed to create User",
        "errors" : {
          "email": "Email is invalid",
          ...
        }
      }
  curl: |
    curl -i :api_url/v1/users \
      -F "user[first_name]=Jon" \
      -F "user[last_name]=Doe" \
      -F "user[email]=jon2_doe@twg.ca" \
      -F "user[username]=jon2_doe" \
      -F "user[password]=passpass" \
      -F "user[avatar]=@test/fixtures/upload.png" \
      -F "user[cover_photo]=@test/fixtures/upload.png"
```


## Configuration

You can change the default configuration of this gem by adding the following code to your initializers folder:

``` ruby
ApiDocs.configure do |config|
  config.yaml_docs_folder = '/some/other/folder ' # the default folder is /doc/api
end
```


---

Copyright 2012 Jack Neto, [The Working Group, Inc](http://www.theworkinggroup.ca)

