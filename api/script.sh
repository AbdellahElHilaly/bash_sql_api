# Write a script that interacts with a RESTful API, such as retrieving data, performing CRUD operations, or processing JSON responses.

# code:
#!/bin/bash
# This script is used to interact with a RESTful API
# It retrieves data, performs CRUD operations, or processes JSON responses

# API URL
url="https://jsonplaceholder.typicode.com/posts"

# Get all posts
curl -X GET "$url"

# Get a single post
