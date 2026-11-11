# HTTP

## Question 1


To get the flag, start the above exercise, then use cURL to download the file returned by '/download.php' in the server shown above.

HTB{64$!c_cURL_u$3r}

# HTTP Requests and Responses

Answer questions in English to ensure an accurate response.


## Question 1


What is the HTTP method used while intercepting the request? (case-sensitive)
GET

Hint

## Question 2


Send a GET request to the above server, and read the response headers to find the version of Apache running on the server, then submit it as the answer. (answer format: X.Y.ZZ)
curl -I 154.57.164.77:41398



# GET

## Question 1


The exercise above seems to be broken, as it returns incorrect results. Use the browser devtools to see what is the request it is sending when we search, and use cURL to search for 'flag' and obtain the flag.
Authenticate to with user "admin" and password "admin"

curl --url 'http://154.57.164.79:30772/search.php?search=flag' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Authorization: Basic YWRtaW46YWRtaW4=' \
  -H 'Connection: keep-alive' \
  -H 'Referer: http://154.57.164.79:30772/' \
  --insecure

# POST

Answer questions in English to ensure an accurate response.


## Question 1


Obtain a session cookie through a valid login, and then use the cookie with cURL to search for the flag through a JSON POST request to '/search.php'
Authenticate to with user "admin" and password "admin"

curl --url 'http://154.57.164.80:36206/search.php' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json' \
  -b 'PHPSESSID=slp4k11e639nvkqu5a2n7v8h4d' \
  -H 'Origin: http://154.57.164.80:36206' \
  -H 'Referer: http://154.57.164.80:36206/' \
  --data-raw '{"search":"flag"}' \
  --insecure


# CRUD API

Answer questions in English to ensure an accurate response.


## Question 1


First, try to update any city's name to be 'flag'. Then, delete any city. Once done, search for a city named 'flag' to get the flag.

curl -X PUT http://154.57.164.81:42634/api.php/city/london -d '{"city_name":"flag", "country_name":"Random"}' -H 'Content-Type: application/json'


curl -X DELETE http://154.57.164.81:42634/api.php/city/leeds
