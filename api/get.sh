# Write a script that interacts with a RESTful API, such as retrieving data, performing CRUD operations, or processing JSON responses.


#get url from url.txt
echo "Reading url from url.txt..."
url=$(cat url.txt)

echo "url has been read successfully."

# Get all posts and store it in a variable
posts=$(curl -s "$url")

echo "posts has been read successfully."

echo "$posts" > "data\posts.json"

echo "Data written to posts.json successfully."

