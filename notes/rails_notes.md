# Rails Notes

## What is Rails?

Rails is a Ruby framework. It uses MVC: Model, View, Controller.

## MVC

Model = data and database logic  
View = what the user sees  
Controller = handles requests and decides what to return

## Request flow

Browser request  
→ route in config/routes.rb  
→ controller action  
→ view  
→ response

## Important folders

app/controllers = controller files  
app/models = model/database classes  
app/views = HTML/ERB templates  
config/routes.rb = URL routing  
db/migrate = database migrations  
Gemfile = dependencies

## HTTP

HTTP is the request-response system used between a browser and a server.

A request has: 
- averb/method, such as Get or POST
- a path or URL
- headers
- sometimes a body

A response has:
- a status code
- headers
- suaully a body, such as HTML or JSON

## Common HTTP verbs

GET = retrieve/read data
POST = submit/create data
PATCH/PUT = update existing data
DELETE = delete data

## RESTful Rails routes

For a resource like `posts`:

- `index` = GET all posts
- `show` = GET one post
- `new` = GET the form for a new post
- `create` = POST form data to create a post
- `edit` = GET the form to edit a post
- `update` = PATCH/PUT form data to update a post
- `destroy` = DELETE a post

## Cookies and sessions

HTTP is stateless, meaning each request is separate.

Cookies let the browser send small pieces of data back to the server on future requests.

Sessions use cookies to remember things like whether a user is logged in.

## Authentication vs Authorisation

Authentication = who is the user?
Authorisation = what is this user allowed to do?

# Routing

The Rails router matches an incoming request to the correct controller action.

A route is matched using:

- the HTTP verb, such as `GET`, `POST`, `PATCH`, or `DELETE`
- the URL path, such as `/posts` or `/posts/1`

Example:

```ruby
get "/posts", to: "posts#index"
```

When a request enters the application, Rails also collects any parameters and makes them available in a hash called params.

For example:

```ruby
get "/posts/:id", to: "posts#show"
```

If the user visits:

`/posts/5`

Rails stores the ID in:

```ruby
params[:id]
```

The :id part is a dynamic value. It can match different records, such as `/posts/1`, `/posts/5`, or `/posts/100`.

## Root

The root is where users should be deposited when they land on the web page

```ruby
root to: "posts#index"
```

The 7 RESTful actions for a resource like posts

```ruby
get "/posts", to: "posts#index"
get "/posts/new", to: "posts#new"
get "/posts/:id", to: "posts#show"
post "/posts", to: "posts#create"
get "/posts/:id/edit", to: "posts#edit"
patch "/posts/:id", to: "posts#update"
delete "/posts/:id", to: "posts#destroy"
```

Rails can create all 7 standard RESTful routes with one line:

```ruby
resources :posts
```

Some routes use the same URL path but different HTTP verbs.

Example:

```ruby
get "/posts", to: "posts#index"
post "/posts", to: "posts#create"
```

Both use `/posts`, but they do different things:

`GET /posts` = show all posts
`POST /posts` = create a new post

So a route is not just the URL. It is the HTTP verb and the URL path together.

## Viewing Routes

To see all routes in a Rails app, run:

```bash
rails routes
```

This shows:

the route helper name
the HTTP verb
the URL path
the controller action

Example output might include:

edit_post GET /posts/:id/edit posts#edit

This means:
`A GET request to /posts/:id/edit runs the edit action in PostsController`

## Route Helpers

Rails creates helper methods for routes so links do not need to be hardcoded.

Example:

`<%= link_to "Edit this post", edit_post_path(3) %>`

This creates a link to:

`/posts/3/edit`

Using route helpers is better than hardcoding URLs because if the route changes later, Rails can still generate the correct path.

## Limiting Routes

Sometimes an app does not need all 7 RESTful routes.

To only create specific routes:

```ruby
resources :posts, only: [:index, :show]
```
To create all routes except some:

```ruby
resources :posts, except: [:destroy]
```
## Non-RESTful Routes

Rails also allows custom routes when needed.

Example:

```ruby
get "/about", to: "pages#about"
```
This means:

A `GET` request to `/about` runs the `about` action inside `PagesController`.

## Main Thing to Remember

A Rails route connects a request to a controller action.

`HTTP verb + URL path → controller#action`

Example:

```ruby
get "/cars", to: "cars#index"
```
means:

`GET /cars → CarsController#index`