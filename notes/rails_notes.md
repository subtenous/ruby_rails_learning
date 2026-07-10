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

## example request flow in my cars app

When `/cars` is visited, Rails matches:

Get `/cars` -> `cars#index`

This runs the `index` action in `CarsController`

The controller gets all cars:

```ruby
@cars = Car.all
```

The view can use @cars because instance variables from the controller are available in the view.

Rails then renders:

`app/views/cars/index.html.erb`

## Adding a basic custom page

I generated a pages controller with an `about` action:

```bash
rails generate controller Pages about
```

Example:

```ruby
get "pages/about"
```

This means visiting:

`pages/about`

runs the `about` action in `PagesController`

## Controller to View instance variable

in `app/controllers/pages_controller.rb`, I added an instance variable:

```ruby
class PagesController < ApplicationController
  def about
    @app_name = "My First Rails App"
  end
end
```
The view can then use that variable in 
`app/views/pages/about.html.erb`

Example:
```html
<p>App name: <%= @app_name %></p>
```
This works because instance variables created in a controller action are available to that action's view

Root Route in My Cars app

I set the homepage of the app using:

```ruby
root "cars#index
```

This means visiting the page without a path runs 
`CarsController#index`

## Link Helper
In the about page, I added a link back to the cars page:

```html
<%= link_to "Back to cars", cars_path %>
```

cars_path is a route helper generated by Rails.

It creates a link to:

/cars

This is better than hardcoding /cars because Rails can generate the correct path from the route name.

## Where Cars Are Stored

Cars created through the form are stored in the database.

The flow is:

New car form
→ POST /cars
→ CarsController#create
→ Car.new(car_params)
→ @car.save
→ saved as a row in the cars table

The Car model represents the cars database table.

The model file is:

`app/models/car.rb`

The database table was created by a migration in:

`db/migrate`

In the Rails console, I can view the saved cars with:

```ruby
Car.all
```

# Controllers 

Controllers handle requests after the router has matched a route.

A controller action is a method inside a controller.

Example:

```ruby
def index
  @cars = Car.all
end
```

This action asks the Car model for all cars and stores them in @cars.

Instance variables created in a controller action are available in the matching view.

Example flow:

GET /cars
→ CarsController#index
→ @cars = Car.all
→ app/views/cars/index.html.erb

## Naming Convention

Rails relies heavily on naming conventions.

For example:

`CarsController#index`

will automatically render:

`app/views/cars/index.html.erb`

unless told otherwise.

This works because the controller is called CarsController, the action is called index, and the view file is in the matching cars folder.

## Params

params contains data sent with the request

for a route like:

`/cars/3`

Rails stores the ID in:

```ruby
params[:id]
```

A controller can then find the correct car:

```ruby
@car = Car.find(params.expect(:id))
```

Form data is also send through params

## Strong Parameters

Strong parameters protect the app by only allowing specific form fields

Example:

```ruby
def car_params
    params.expect(car: [ :make, :model, :year ])
end
```

## Render vs Redirect

redirect_to sends the browser to a new route. This creates a new HTTP request.

Example: 

```ruby
redirect_to @car, notice: "Car was successfully created."
```

This usually happens after successfully creating, updating, or deleting something.

render displays a view without starting new request.

Example:

```ruby
render :new, status: : unprocessable_entity
```

This is often used when saving fails, so the user can see the form again wth errors.

Simple rule:

- Save worked → redirect_to
- Save failed → render the form again

## Flash messages

Flash messages are one-time messages shown to the user.

Example:

```ruby
redirect_to @car, notice: "Car was successfully created."
```

The `notice` is a flash message.

Flash messages are useful after redirects because they survive the new request.

For rendering without redirecting, Rails can use `flash.now`

# Views

Views are the user-facing part of a Rails app.

A view is a HTML template with embedded Ruby. Rails uses the view to generate the HTML response that is sent back to the browser.

Views are stored using this pattern:

```text
app/views/controller_name/action_name.html.erb
```

For example:

```text
CarsController#index
```

will automatically render:

`app/views/cars/index.html.erb`

unless the controller is told to render something else.

Instance variable created in a cointroller action are available in the matching view.

Example controller:

```ruby
def index
  @cars = Car.all
end
```

example view:

```text
<% @cars.each do |car| %>
  <p><%= car.make %></p>
<% end %>
```

This works because @cars was created in the controller and passed to the view

##Layouts

A layout is the outer shell of the webpage.

Layouts live in:

`app/views/layouts`

The main Rails layout is usually:

`app/views/layouts/application.html.erb`

The layout contains shared HTML structure such as:

- DOCTYPE
- <html>
- <head>
- CSS and JavaScript tags
- navbar
- footer
- flash messages

The individual view gets inserted into the layout where Rails sees:

`<%= yield %>`

So the layout wraps around the current page.

Simple flow:

layout starts
→ <%= yield %> inserts current view
→ layout finishes

## ERB

ERB stands for Embedded Ruby.

It allows Ruby code to run inside HTML.

`<% %>` runs Ruby code but does not output anything.

Example:

`<% @cars.each do |car| %>`

`<%= %>` runs Ruby code and outputs the result into the HTML.

Example:

`<%= car.make %>`

`<%# %>` is an ERB comment.

Example:

`<%# This comment will not appear in the HTML %>`

Use `<% %>` for Ruby logic such as loops and if statements.

Use `<%= %>` when something should be displayed on the page.

Example:

```text
<% if @cars.any? %>
  <p>There are <%= @cars.count %> cars saved.</p>
<% else %>
  <p>No cars have been added yet.</p>
<% end %>
```

Important: Ruby blocks and conditionals in ERB still need end.

## Partials

Partials are reusable view files.

They help avoid repeating the same HTML/ERB in multiple places.

Partial files start with an underscore.

Example:

`app/views/cars/_form.html.erb`

The partial is rendered without the underscore:

`<%= render "form" %>`

A common example is a form partial.

The same `_form.html.erb` partial can be reused by both:

`app/views/cars/new.html.erb`
`app/views/cars/edit.html.erb`

This avoids duplicating the form code.

## Passing Local Variables to Partials

Partials can receive local variables.

Example:

`<%= render "car", car: car %>`

Inside the partial, the variable is used without @:

`<%= car.make %>`

This is better than relying on instance variables inside partials because it makes the partial easier to reuse.

## Rendering Collections

Rails can render a collection using partials.

Instead of manually writing:

```text
<% @cars.each do |car| %>
  <%= render "car", car: car %>
<% end %>
```

Rails can often use the shortcut:

`<%= render @cars %>`

Rails will look for a partial named:

`app/views/cars/_car.html.erb`

and render it once for each car.

## Link Helpers

Rails views use helper methods to generate HTML.

`link_to` creates an anchor tag.

Instead of hardcoding:

`<a href="/cars">Back to cars</a>`

Rails prefers:

`<%= link_to "Back to cars", cars_path %>`

cars_path generates a relative path like:

`/cars`

cars_url generates a full URL like:

`http://localhost:3000/cars`

Most of the time, `_path` is enough inside the app.

## Asset Tags

Rails has helpers for linking assets such as CSS, JavaScript, and images.

Examples:

```text
<%= stylesheet_link_tag "application" %>
<%= javascript_include_tag "application" %>
<%= image_tag "example.jpg" %>
```

These helpers generate the correct HTML tags for loading assets.

## Practical Views Task

In my cars scaffold app, I edited the views to understand how Rails displays data from the controller.

The index action in CarsController sets:

```ruby
@cars = Car.all
```

The `index.html.erb` view can then use `@cars`.

Example:

```text
<% if @cars.any? %>
  <p>There are <%= @cars.count %> cars saved.</p>
<% else %>
  <p>No cars have been added yet.</p>
<% end %>
```

This showed me that views can use Ruby logic to decide what HTML to display.

I also looked at the scaffold partials:
```text
app/views/cars/_car.html.erb
app/views/cars/_form.html.erb
```

`_car.html.erb` is used to display a car.

`_form.html.erb` is reused by both the new and edit pages.

I also used route helpers in views.

Example:

`<%= link_to "Back to cars", cars_path %>`

This creates a link to the cars index page without hardcoding `/cars`.

## Main Thing to Remember

Views display the data prepared by controllers.

Example flow:

GET /cars
→ route sends request to CarsController#index
→ controller sets @cars = Car.all
→ Rails renders app/views/cars/index.html.erb
→ view uses @cars to generate HTML
→ browser receives the final HTML page