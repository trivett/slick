# Slick API

### An API for Slack-like messages

#### Version 1 documentation

# Local Setup

#### Run the following from your terminal. The last command will fill the database with fake conversations, messages, and users. Leave it off if you want to start with an empty database.

```
$ git clone git@github.com:trivett/slick.git
$ cd slick
$ bundle install
$ rake db:create && rake db:schema:load
$ rake db:seed 
```

#### Edit your hosts file

* Run the following command:

```
$ sudo vim  /etc/hosts

```
* Insert `127.0.0.1»api.slick.dev` to the hosts file to enable the API to run locally on a subdomain. The root of the project will be `https://api.slick.dev:3000/` when the server runs.

* Run the server: 

```
$ rails s

```

* You are now ready to issue requests to the API, which responds only with JSON.

#API Endpoints

### List all present users

````
GET /users(.:format)
````
Example: 

```
$ curl -X GET -H "Content-Type: application/json" api.slick.dev:3000/users

[{"id":1,"email":"helga_ratke@flatley.info","created_at":"2015-09-07T22:07:03.710Z","updated_at":"2015-09-07T22:07:03.710Z","name":"Sage Emard"},{"id":2,"email":"nola@stiedemannshanahan.name","created_at":"2015-09-07T22:07:03.794Z","updated_at":"2015-09-07T22:07:03.794Z","name":"Ned Murray"},{"id":3,"email":"oda.becker@grimescartwright.name","created_at":"2015-09-07T22:07:03.873Z","updated_at":"2015-09-07T22:07:03.873Z","name":"Fredy Little"}, .....]

```

### Render one user by id along with the user's messages

```
GET /users/:id
```
Example


```
$ curl -X GET -H "Content-Type: application/json" api.slick.dev:3000/users/2

{
user: "Ned Murray",
email: "nola@stiedemannshanahan.name",
messages: [
{
conversation: {
id: 2,
name: "Bloody Friday"
},
content: "Moon trust fund you probably haven't heard of them mixtape cardigan etsy stumptown hoodie."
},
{
conversation: {
id: 2,
name: "Bloody Friday"
},
content: "Moon trust fund you probably haven't heard of them mixtape cardigan etsy stumptown hoodie."
}, ....

```

### Create a user

```
POST /users/

```

Example

```
$ curl -X POST -H "Content-Type: application/json" -d '{"user": {"name": "vincent", "email": "trivett@gmail.com", "password": "secretsauce", "password_confirmation": "secretsauce"}}' api.slick.dev:3000/users/


````

### List all of the messages that a user has posted to any conversation

```
GET /users/:user_id/messages
```
Example

```
$ curl -X GET -H "Content-Type: application/json" api.slick.dev:3000/users/2/messages

[{"id":4,"content":"Moon trust fund you probably haven't heard of them mixtape cardigan etsy stumptown hoodie.","conversation_id":2,"user_id":2,"created_at":"2015-09-07T22:07:05.450Z","updated_at":"2015-09-07T22:07:05.450Z"},{"id":5,"content":"Iphone messenger bag put a bird on it fap next level before they sold out." ..... ]
```


### List all of the conversations that a user participates in

```
GET /users/:user_id/conversations

```

Example:

```
$ curl -X GET -H "Content-Type: application/json" api.slick.dev:3000/users/6/conversations

[{"id":6,"name":"When Dayne Met Cara"},{"id":11,"name":"The Monster from 13294 Leagues"},{"id":10,"name":"Invasion of the Diaries"}]%

```

### List all of the available conversations

```
GET /conversations

```

Example

```
$ curl -X GET -H "Content-Type: application/json" api.slick.dev:3000/conversations

[{"id":1,"name":"Diaries 2: Electric Boogaloo"},{"id":2,"name":"Bloody Friday"},{"id":3,"name":"Brains 2: Electric Boogaloo"},{"id":4,"name":"The White Rose of England"}, ....]

```

### Show a conversation along with its messages

```
GET /conversations/:id
```

Example


```
$ curl -X GET -H "Content-Type: application/json" api.slick.dev:3000/conversations/2
{
conversation: "Bloody Friday",
name: "Bloody Friday",
messages: [
{
user: {
id: 2,
email: "nola@stiedemannshanahan.name",
created_at: "2015-09-07T22:07:03.794Z",
updated_at: "2015-09-07T22:07:03.794Z",
name: "Ned Murray"
},
content: "Moon trust fund you probably haven't heard of them mixtape cardigan etsy stumptown hoodie."
},
{
user: {
id: 2,
email: "nola@stiedemannshanahan.name",
created_at: "2015-09-07T22:07:03.794Z",
updated_at: "2015-09-07T22:07:03.794Z",
name: "Ned Murray"
},
content: "Iphone messenger bag put a bird on it fap next level before they sold out."
},
```


### List users participating in a given conversation

```
GET /conversations/:conversation_id/users
```

Example

```
$ curl -X GET -H "Content-Type: application/json" api.slick.dev:3000/conversations/3/users

[{"id":3,"email":"oda.becker@grimescartwright.name","created_at":"2015-09-07T22:07:03.873Z","updated_at":"2015-09-07T22:07:03.873Z","name":"Fredy Little"},{"id":13,"email":"evans.cormier@auerbogisich.us"... ]

```

### List all messages in a given conversation

```
GET /conversations/:conversation_id/messages

```

Example: 

```
$ curl -X GET -H "Content-Type: application/json" api.slick.dev:3000/conversations/10/messages

[{"id":12,"content":"Scenester messenger bag moon Carles Pitchfork squid echo park.","conversation_id":10,"user_id":4,"created_at":"2015-09-07T22:07:05.502Z","updated_at":"2015-09-07T22:07:05.502Z"},{"id":18,"content":"Keffiyeh DIY vice +1 seitan." ... ]
```


### Create a new conversation

```
POST /conversations
```

Example

```
$ curl -X POST -H "Content-Type: application/json" -d '{"conversation": {"name": "lets discuss game of thrones, shall we"}}' api.slick.dev:3000/conversations/

{"id":21,"name":"let us discuss game of thrones, shall we"}%
````


### Admit a User to a conversation 

```
PUT    /conversations/:conversation_id/admit_user/:user_id
```

Example

```
$ curl -X PUT -H "Content-Type: application/json"  -d '' api.slick.dev:3000/conversations/3/admit_user/11

[{"id":6,"email":"aletha_daniel@gaylord.co.uk","created_at":"2015-09-07T22:07:04.105Z","updated_at":"2015-09-07T22:07:04.105Z","name":"Emile Donnelly"},{"id":9,"email":"buck_kling@mcglynngerhold.name","created_at":"2015-09-07T22:07:04.345Z","updated_at":"2015-09-07T22:07:04.345Z","name":"Nathen Toy"},{"id":11,"email":"benny@shields.us","created_at":"2015-09-07T22:07:04.497Z","updated_at":"2015-09-07T22:07:04.497Z","name":"Quentin Pfannerstill"},
```

### Post a message on behalf of a user

```
POST /conversations/:conversation_id/messages/create/:user_id
```

Example

```
$ curl -X POST -H "Content-Type: application/json" -d '{"message": {"content": "Hello world!"}}' api.slick.dev:3000/conversations/3/messages/create/6.

{"id":78,"content":"Hello world!","conversation_id":3,"user_id":6,"created_at":"2015-09-08T01:28:05.536Z","updated_at":"2015-09-08T01:28:05.536Z"}%
```

















