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

## Store App Summary

The Store App project gave me practice building a basic CRUD resource in Rails.

The main resource was `Product`.

The app included:

- `index` to show all products
- `show` to show one product
- `new` to display the new product form
- `create` to save a new product
- `edit` to display the edit form
- `update` to save changes to an existing product
- `destroy` to delete a product

The main Rails flow was:

```text
route → controller action → model/database → view or redirect
```

The model was created with:

```bash
bin/rails generate model Product name:string
```

The database table was created by running: 

```bash
bin/rails db:migrate
```

The route shortcut:

```ruby
resources :products
```

created the standard RESTful routes for products.

The controller used `before_action` to avoid repeating:

```ruby
@product = Product.find(params.expect(:id))
```

for `show`, `edit`, `update`, and `destroy`.

The form used:

```text
<%= form_with model: product do |form| %>
```

This lets Rails build the correct form for either creating a new products or editing an existing product.

The app used strong parameters:

```ruby
def product_params
  params.expect(product: [ :name ])
end
```

This only allows the `name` field from the submitted form data.

The form was extracted into a partial:

`app/view/products/_form.html.erb`

This allowed both `new.html.erb` and `edit.html.erb` to reuse the same form code.

Main thing learned:

Rails CRUD apps follow a repeated pattern. Once I understand one resource like Product, I can apply the same structure to other resources.

# Active Record Basics

Active Record is the model layer in Rails.

It lets Ruby objects represent record in a database table. 

Example:

```ruby
class Product < ApplicationRecord
end
```

Even though this class looks empty, Rails uses Active Record to connect it to the products table.

A Product object represents one row in the products table.

## ORM

ORM stands for Object Relational Mapping.

It connects Ruby objects to database tables.

Instead of writing SQL manually, Rails lets me write Ruby methods.

Example SQL:

```sql
SELECT * FROM products;
```

Active Record:

```ruby
Product.all
```
Example SQL:

```sql
SELECT * FROM products WHERE id = 1;
```

Active Record:

```ruby
Product.find(1)
```

Active Record still generates SQL behind the scenes, but I usually interact with it using Ruby.

## Naming Conventions

Rails uses convention over configuration.

Model names are singular and use CamelCase:

```ruby
Product
LineItem
BookClub
```

Database table names are plural and use snake_case:
```text
products
line_items
book_clubs
```

Examples:

```text
Product → products
Book → books
LineItem → line_items
Person → people
```

Rails uses these naming conventions automatically.

## Schema Conventions

Rails database tables normally have an `id` primary key automatically.

Example:

```text
id
name
created_at
updated_at
```

`id` uniquely identifies each record.

`created_at` is automatically set when the record is created.

`updated_at` is automatically updated when the record changes.

Foreign keys usually follow this pattern:

`singular_model_name_id`

Examples:

```text
product_id
booking_id
flight_id
airport_id
```

This will matter for associations in Flight Booker.

## Creating Models and Migrations

A model and migration can be generated with:

```bash
bin/rails generate model Product name:string
```

This creates:

```text
app/models/product.rb
db/migrate/...create_products.rb
```

The model represents the Ruby class.

The migration describes the database table change.

Example migration:

```ruby
create_table :products do |t|
  t.string :name

  t.timestamps
end
```

This creates a `products` table with:

```text
id
name
created_at
updated_at
```

Run migrations with:

```bash
bin/rails db:migrate
```

Undo the last migration with:

```bash
bin/rails db:rollback
```

## CRUD with Active Record

CRUD means:

```text
Create
Read
Update
Delete
```

## Create

`new` creates an object in memory but does not save it yet:

```ruby
product = Product.new(name: "T-Shirt")
product.save
```

`create` creates and saves in one step:

```ruby
Product.create(name: "T-Shirt")
```

The hash:

```ruby
{ name: "T-Shirt" }
```

sets the model attributes.

## Read

Get all records:

```ruby
Product.all
```

Find one record by ID:

```ruby
Product.find(1)
```

Find the first matching record:

```ruby
Product.find_by(name: "T-Shirt")
```

Filter records:

```ruby
Product.where(name: "T-Shirt")
```

Order records:

```ruby
Product.order(name: :asc)
```

`find` returns one object.

`where` returns a collection-like ActiveRecord relation, because multiple records could match.

## Update

Find a record, change an attribute, then save:

```ruby
product = Product.find(1)
product.name = "Shoes"
product.save
```

Or update in one step:

```ruby
product.update(name: "Shoes")
```

## Delete

Delete a record:

```ruby
product = Product.find(1)
product.destroy
```

## Validations

Validations check that data is valid before it is saved to the database.

Example:

```ruby
class Product < ApplicationRecord
  validates :name, presence: true
end
```

This means a product must have a name.

If the product is invalid:

```ruby
product.save
```

returns:

```ruby
false
```

Errors can be checked with:

```ruby
product.errors.full_messages
```

Example:

`["Name can't be blank"]`

## Callbacks

Callbacks run code at certain points in a model’s lifecycle.

Example:

```ruby
after_create :log_new_user
```

This would run after a record is created.

Callbacks are useful, but I do not need to focus on them deeply yet.

## Associations

Associations define relationships between models.

Example:

```ruby
class Author < ApplicationRecord
  has_many :books
end
```
This means one author can have many books.

Associations will be important for Flight Booker.

Example Flight Booker relationships:

```text
Flight has many bookings
Booking belongs to flight
Booking has many passengers
Passenger belongs to booking
```

## Main Thing to Remember

Active Record lets Rails models talk to database tables.

A model object represents a row in a table.

Example:

```ruby
product = Product.find(1)
product.name
```

This finds one row from the `products` table and reads its `name` column.

Active Record lets me use Ruby methods instead of writing SQL manually.

# Migrations

A migration is a Ruby file that changes the database schema.

The schema is the structure of the database, such as:

- tables
- columns
- indexes
- foreign keys

A migration does not usually create or move data. It changes the structure of the database.

Migration files live in:

```text
db/migrate
```

A migration is like a version of the database. Rails uses the timestamp in the migration filename to know which migrations have already been run and what order to run them in.

## Model vs Migration

A model is a Ruby class used by Rails to talk to a database table.

Example:

`app/models/product.rb`

A migration is a script that creates or changes the database table.

Example:

`db/migrate/...create_products.rb`

Simple rule:

```text
Model = Ruby object/table interface
Migration = database structure change
```

For example:

```ruby
class Product < ApplicationRecord
end
```

is the model.

```ruby
create_table :products do |t|
  t.string :name
  t.timestamps
end
```

is the migration that creates the table.

## Model Generator

Use the model generator when creating a new model and table.

Example:

```bash
bin/rails generate model Product name:string
```

This creates:

```text
app/models/product.rb
db/migrate/...create_products.rb
```
The model represents individual products in Ruby.

The migration creates the `products` table in the database.

## Migration Generator

Use the migration generator when changing an existing table.

Example:

`bin/rails generate migration AddPriceToProducts price:decimal`

This creates a migration only.

It does not create a new model.

This is useful when the model/table already exists and I just need to change the database structure.

## Running Migrations

Generating a migration only creates the migration file.

To apply the migration to the database, run:

```bash
bin/rails db:migrate
```

This runs any migrations that have not been run yet.

To undo the most recent migration:

```bash
bin/rails db:rollback
```

## Typical Blank Rails App Database Flow

For a new Rails app:

```bash
rails new app_name
cd app_name
bin/rails db:create
bin/rails generate model Product name:string
bin/rails db:migrate
```

`db:create` creates the database.

`generate model` creates the model and migration file.

`db:migrate` applies the migration and creates/changes tables.

With SQLite, `db:create` may feel less obvious because the database is just a local file.

With PostgreSQL, `db:create` is more important because Rails needs to create the development and test databases.

## schema.rb

After migrations run, Rails updates:

`db/schema.rb`

`schema.rb` is a snapshot of the current database structure.

It is useful for quickly seeing what tables and columns exist.

The migration history shows how the database changed over time.

The schema file shows what the database looks like now.

## References and Foreign Keys

Migrations can also create reference columns that connect tables together.

Example:

```bash
bin/rails generate model Passenger booking:references name:string email:string
```

This creates a `passengers` table with a `booking_id` column.

The `booking_id` column is used to connect each passenger to a booking.

Example:

`passengers.booking_id → bookings.id`

In Rails, this usually matches an association:

```ruby
class Passenger < ApplicationRecord
  belongs_to :booking
end

class Booking < ApplicationRecord
  has_many :passengers
end
```

A reference column is usually named using this pattern:

`model_name_id`

Examples:

```text
booking_id
flight_id
airport_id
```

Models can be connected:

- Booking belongs to Flight
- Passenger belongs to Booking
- Flight has many Bookings

## Basic Validations

Validations are rules in a model that check whether data is valid before it is saved to the database.

Example:

```ruby
class Product < ApplicationRecord
  validates :name, presence: true
end
```

This means a product cannot be saved without a name.

Validations usually run before:

```ruby
save
create
update
```

If the object is invalid, Rails will not save it to the database.

## Checking Validity

```ruby
product = Product.new
product.valid?
```

`valid?` runs the validations and returns `true` or `false`.

```ruby
product.errors.full_messages
```

shows the validation error messages.

Example:
```ruby
product = Product.new
product.valid?
product.errors.full_messages
```
Result:

`["Name can't be blank"]`

## Common Validations

Presence:

```ruby
validates :name, presence: true
```
Length:

```ruby
validates :name, length: { minimum: 2 }
```

Numericality:

```ruby
validates :duration, numericality: { only_integer: true }
```
Uniqueness:

```ruby
validates :code, uniqueness: true
```

Format:

```ruby
validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
```

Inclusion:
```ruby
validates :status, inclusion: { in: ["pending", "confirmed", "cancelled"] }
```

There are many more but some are less common than others.

## save vs save!

Non-bang methods return false if validation fails:

```ruby
product.save
```
Bang methods raise an error if validation fails:

```ruby
product.save!
```

In controllers, normal `save` is usually useful because the failure can be handled:

```ruby
if @product.save
  redirect_to @product
else
  render :new, status: :unprocessable_entity
end
```

## Validation Errors in Forms

If a form submission fails validation, the controller usually renders the form again:

```ruby
render :new, status: :unprocessable_entity
```

The same invalid object is used, so the view can show its errors.

Example:

<% if @product.errors.any? %>
  <ul>
    <% @product.errors.full_messages.each do |message| %>
      <li><%= message %></li>
    <% end %>
  </ul>
<% end %>

## Main Thing to Remember

Validations belong in the model.

They protect the database from invalid data and keep the controller simpler.

For Flight Booker, validations will be used to make sure important fields exist, such as flight times, airport codes, passenger names, and passenger emails.

## Basic Associations

Associations define relationships between models.

Example:

```ruby
class Author < ApplicationRecord
  has_many :books
end

class Book < ApplicationRecord
  belongs_to :author
end
```

This means:
```text
One author can have many books.
Each book belongs to one author.
```

The database connection is made using a foreign key:

`books.author_id → authors.id`

The model with `belongs_to` usually has the foreign key.

Example migration:

```ruby
create_table :books do |t|
  t.string :title
  t.references :author, null: false, foreign_key: true

  t.timestamps
end
```
Rails then gives useful methods:

```ruby
author.books
book.author
author.books.create(title: "The Hobbit")
```
`author.books.create(...)` creates a book and automatically sets the `author_id`.

Main rule:

belongs_to side has the foreign key.
has_many side owns the collection.

Flight Booker examples:

```ruby
class Flight < ApplicationRecord
  has_many :bookings
end

class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers
end

class Passenger < ApplicationRecord
  belongs_to :booking
end
```
This means:

```text 
A flight has many bookings.
A booking belongs to one flight.
A booking has many passengers.
A passenger belongs to one booking.
```

## Micro-Reddit

Micro-Reddit was a console-only Rails project focused on models, validations and associations.

### Models

```ruby
class User < ApplicationRecord
  has_many :posts
  has_many :comments
end

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
```
### Database relationships
```text
posts.user_id → users.id

comments.user_id → users.id
comments.post_id → posts.id
```

The model on the `belongs_to` side contains the foreign key.

### Association methods

Rails creates useful methods from associations:

```ruby
user.posts
post.user

user.comments
post.comments

comment.user
comment.post
```

A collection association such as:

```ruby
user.comments
```

can return multiple records.

To retrieve one record:

```ruby
user.comments.first#
```

### Creating through an association

```ruby
post = user.posts.create(
  title: "First post",
  body: "Post content"
)
```

Rails automatically sets `post.user_id`.

```ruby
comment = user.comments.create(
  body: "A comment",
  post: post
)
```
Rails automatically sets `comment.user_id`, while `post: post` sets `comment.post_id`.

# Active Record Queries

## Return types

```ruby
User.find(1)        # Returns a User object
User.find_by(...)   # Returns one User or nil
User.where(...)     # Returns an ActiveRecord::Relation
```

`where` returns a Relation so queries can be chained

## Common query methods

```ruby
where
find
find_by
order
limit
count
exists?
pluck
joins
includes
```

## Chaining

```ruby
User.where(active: true).order(created_at: :desc).limit(5)
```
Relations are lazily evaluated until needed.

## N+1 queries

Bad:

```ruby
User.all.each do |user|
  puts user.posts.count
end
```

Better:

```ruby
User.includes(:posts).each do |user|
  puts user.posts.count
end
```

`includes` loads associated records in advance.

##Things to remember

- `find` → by ID
- `find_by` → first matching record
- `where` → relation (chainable)
- `joins` → query across tables
- `pluck` → return column values only
- `exists?` → true/false

## Active Record Associations

Rails assumes:
- association name -> model
- association_name_id -> foreign key

class_name:
- Use when the association name doesn't match the model name.
- Tells Rails which model the association refers to.

Example:
```ruby
belongs_to :author, class_name: "User"
```

foreign_key:
- Use when the foreign key column isn't what Rails expects.
- Tells Rails which column contains the ID.

Example:
```ruby
has_many :authored_posts,
         class_name: "Post",
         foreign_key: "author_id"
```
Useful:
```ruby
user.posts.create(...)   # sets foreign key automatically
user.posts << post
```
```ruby
dependent: :destroy
```
- Deletes associated records when the parent is deleted.

`source:` tells Rails which association to use in the join model when `has_many :through` can't work it out automatically.
